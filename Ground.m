//
//  Ground.m
//  Lets_Bounce
//
//  Created by Richard Hall on 14/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Ground.h"

@implementation Ground

- (void)didLoadFromCCB{
}

- (id)init{
    if(self = [super init]){
        _sprite = (CCSprite *)[CCBReader load:@"Ground"];
        [self addChild:_sprite];
        self.contentSize = CGSizeMake(_sprite.contentSize.width, _sprite.contentSize.height);
        self.position = ccp(0, 0);
        [self setScaleX:1.2f];
        bounds = [self boundingBox];
    }
    return self;
}

- (CGRect *)getBounds{
    return &bounds;
}

@end
