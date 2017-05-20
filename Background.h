//
//  Background.h
//  DropNPop
//
//  Created by Richard Hall on 30/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Background : CCNode{
    CCSprite *_sprite;
}

- (id)initWithMenu: (BOOL)menu;

@end
