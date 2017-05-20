//
//  Ground.h
//  Lets_Bounce
//
//  Created by Richard Hall on 14/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Ground : CCNode{
    //CCSprite *sprite;
    
    CGRect bounds;
}

@property CCSprite *sprite;

- (CGRect *)getBounds;

@end
