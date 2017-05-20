//
//  BonusBall.h
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//


#import "Ball.h"


@interface BonusBall : Ball{
    CCActionMoveTo *mta;
    bool touchedBottom;
    bool touched;
}

- (id)initAtXposition: (int)xPos;

- (void)checkBounds;

- (float)getYPosition;

@end
