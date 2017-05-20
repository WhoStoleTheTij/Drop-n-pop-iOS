//
//  SmallCloud.h
//  Drop'n'Pop
//
//  Created by Richard Hall on 22/07/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface SmallCloud : CCNode{
    CGSize winSize;
    CCActionMoveTo *mta;
    float yPos;
}

@property (weak, nonatomic) CCSprite *sprite;

- (id)initAtYPosition: (float)yPosition;

- (void)resetCloud;

- (void)moveCloud;

- (void)checkLocation;

@end
