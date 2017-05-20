//
//  BombBall.h
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//


#import "Ball.h"


@interface BombBall : Ball{
    CGRect _groundBounds;
    bool touchedBottom;
    CCActionMoveTo *mta;
}

- (id)initAtXposition: (int)xPos;

- (void)checkBounds;

- (float)getYPosition;


@end
