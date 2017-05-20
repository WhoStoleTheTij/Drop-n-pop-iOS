//
//  SmallCloud.m
//  Drop'n'Pop
//
//  Created by Richard Hall on 22/07/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "SmallCloud.h"

@implementation SmallCloud

- (id)initAtYPosition:(float)yPosition{
    if(self = [super init]){
        winSize = [[CCDirector sharedDirector]viewSize];
        yPos = yPosition;
        self.sprite = (CCSprite *)[CCBReader load:@"SmallCloud"];
        self.position = ccp(-60, yPos);
        [self setZOrder:10];
        [self addChild: self.sprite];
        mta = [CCActionMoveTo actionWithDuration:80.0f position:ccp(winSize.width + 50, yPos)];
        [self schedule:@selector(checkLocation) interval:0.01f];
    }
    return self;
}

- (void)moveCloud{
    [self runAction:mta];
}

- (void)checkLocation{
    if(self.position.x >= winSize.width + 20){
        [self stopAction:mta];
        [self resetCloud];
        [self moveCloud];
    }
}

- (void)resetCloud{
    self.position = ccp(-60, yPos);
}


@end
