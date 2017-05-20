//
//  Ball.h
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Ball : CCNode{
    //CCSprite *sprite;
    
    int _xPosition;
    
    CGRect _bounds;
    
    __weak OALSimpleAudio *_soundPlayer;
    
    
}

@property (weak, nonatomic) CCSprite *sprite;
@property float speed;

- (void)launchBall;
- (void)setGroundBounds;
- (void)gameOver;

@end
