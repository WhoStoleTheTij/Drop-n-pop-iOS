//
//  BonusBall.m
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "BonusBall.h"


@implementation BonusBall


//create a ball at location xPos at level level and at scale scale
- (id)initAtXposition: (int)xPos{
    
    CGSize winSize = [[CCDirector sharedDirector]viewSize];
    if(self = [super init]) {
        self.userInteractionEnabled = TRUE;
        self.sprite = (CCSprite *)[CCBReader load:@"BonusBall"];
        self.anchorPoint = CGPointZero;
        
        [self setZOrder:20];
        _xPosition = xPos;
        self.position = ccp(_xPosition, winSize.height + 20);
        [self addChild:self.sprite];
        self.contentSizeInPoints = CGSizeMake(self.sprite.contentSize.width, self.sprite.contentSize.height * 1.5f);
        _soundPlayer = [OALSimpleAudio sharedInstance];
        touchedBottom = false;
        touched = false;
        [self schedule:@selector(checkBounds) interval:0.01f];
        
    }
    return self;
    
}

- (float)getYPosition{
    return self.position.y;
}

- (void)checkBounds{
    if(self.position.y <= 5){
        touchedBottom = true;
        [self stopAllActions];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GameOver" object:nil];
    }
}


//launch a ball
- (void)launchBall{
    mta = [CCActionMoveTo actionWithDuration:self.speed position:CGPointMake(_xPosition, 0.0f)];
    [self runAction:mta];
}

//handle the touch
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    if(!touched){
        [self stopAllActions];
        [[self.sprite animationManager]runAnimationsForSequenceNamed:@"Default Timeline"];
        [_soundPlayer playEffect:@"pop.wav" loop:false];
        
        [self scheduleOnce:@selector(removeFromParentAndCleanup:) delay:0.12f];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"BallWasTouched" object:nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"AddThreePointNotification" object:nil];
        touched = true;
    }
    
}

- (void)gameOver{
    [self stopAction:mta];
    self.userInteractionEnabled = false;
    [self unscheduleAllSelectors];
}

@end
