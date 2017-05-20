//
//  Background.m
//  DropNPop
//
//  Created by Richard Hall on 30/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Background.h"

@implementation Background

- (void)didLoadFromCCB{
    
}

- (id)initWithMenu:(BOOL)menu{
    if(self = [super init]){
        CGSize winSize = [[CCDirector sharedDirector]viewSize];
        
        if(menu){
            _sprite = (CCSprite *)[CCBReader load:@"menuBackground"];
        }else{
            _sprite = (CCSprite *)[CCBReader load:@"Background"];
        }
        
        [_sprite setScaleX: winSize.width / _sprite.contentSize.width];
        [_sprite setScaleY: winSize.height / _sprite.contentSize.height];
        [_sprite setZOrder:(NSInteger)0];
        self.position = ccp(0, 0);
        [self addChild:_sprite];
    }
    return self;
}



@end
