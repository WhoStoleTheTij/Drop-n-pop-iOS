//
//  StandardBall.m
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "StandardBall.h"


@implementation StandardBall

//create a ball at location xPos at level level and at scale scale
- (id)initAtXposition: (int)xPos{
    CGSize winSize = [[CCDirector sharedDirector]viewSize];
    if(self = [super init]) {
        self.userInteractionEnabled = TRUE;
        int num = arc4random_uniform(3);
        switch(num){
            case 0:
                self.sprite = (CCSprite *)[CCBReader load:@"PurpleBall"];
                break;
            case 1:
                self.sprite = (CCSprite *)[CCBReader load:@"BlueBall"];
                break;
            case 2:
                self.sprite = (CCSprite *)[CCBReader load:@"GreenBall"];
                break;
            default:
                self.sprite = (CCSprite *)[CCBReader load:@"PurpleBall"];
        }
        
        _xPosition = xPos;
        [self setZOrder:20];
        [self addChild:self.sprite];
        self.position = ccp(xPos, winSize.height + 20);
        self.anchorPoint = CGPointZero;
        self.contentSizeInPoints = CGSizeMake(self.sprite.contentSize.width, self.sprite.contentSize.height * 1.5f);
        
        //make the sound file
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
        [self stopAllActions];
        touchedBottom = true;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GameOver" object:nil];
    }
}


//handle the touch
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    if(!touched){
        [self stopAction:mta];
        [_soundPlayer playEffect:@"pop.wav"];
        [[self.sprite animationManager]runAnimationsForSequenceNamed:@"Default Timeline"];
        [self scheduleOnce:@selector(removeFromParentAndCleanup:) delay:0.12f];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"BallWasTouched" object:nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"AddOnePointNotification" object:nil];
        touched = true;
        
    }
    
}

//launch a ball
- (void)launchBall{
    mta = [CCActionMoveTo actionWithDuration:self.speed position:CGPointMake(_xPosition, 0.0f)];
    [self runAction:mta];
}

- (void)gameOver{
    [self stopAction:mta];
    self.userInteractionEnabled = false;
    [self scheduleOnce:@selector(unscheduleAllSelectors) delay:0.12f];
}

- (void)dealloc{
    self.sprite = NULL;
    _soundPlayer = NULL;
}


@end
