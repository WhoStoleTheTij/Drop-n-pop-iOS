//
//  BombBall.m
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "BombBall.h"


@implementation BombBall


//create a ball at location xPos at level level and at scale scale
- (id)initAtXposition: (int)xPos{
    CGSize winSize = [[CCDirector sharedDirector]viewSize];
    if(self = [super init]) {
        self.sprite = (CCSprite *)[CCBReader load:@"BombBall"];
        
        self.anchorPoint = CGPointZero;
        [self addChild:self.sprite];
        [self setZOrder:20];
        self.position = ccp(xPos, winSize.height + 20);
        _xPosition = xPos;
        self.userInteractionEnabled = TRUE;
        self.contentSizeInPoints = CGSizeMake(self.sprite.contentSize.width, self.sprite.contentSize.height * 1.5f);
        _soundPlayer = [OALSimpleAudio sharedInstance];
        touchedBottom = false;
        
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
        [[self.sprite animationManager]runAnimationsForSequenceNamed:@"Default Timeline"];
        [_soundPlayer playEffect:@"explosion.wav"];
        [self scheduleOnce:@selector(removeFromParentAndCleanup:) delay:0.12f];
        [self unschedule:@selector(checkBounds)];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"BallWasTouched" object:nil];
    }
}

//launch a ball
- (void)launchBall{
    mta = [CCActionMoveTo actionWithDuration:self.speed position:CGPointMake(_xPosition, 0.0f)];
    [self runAction:mta];
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"BallWasTouched" object:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SubtractTenPoints" object:nil];
    [self stopAllActions];
    [[self.sprite animationManager]runAnimationsForSequenceNamed:@"Default Timeline"];
    [_soundPlayer playEffect:@"explosion.wav" loop:FALSE];
    [self scheduleOnce:@selector(removeFromParentAndCleanup:) delay:0.1f];
}

- (void)dealloc{
    self.sprite = NULL;
    _soundPlayer = NULL;
}

- (void)gameOver{
    [self stopAction:mta];
    self.userInteractionEnabled = false;
    [self unscheduleAllSelectors];
}

@end
