//
//  CreditScene.h
//  Drop'n'Pop
//
//  Created by Richard Hall on 22/07/2015.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Background.h"

@interface CreditScene : CCNode {
    
    CCLabelTTF *_artistTitleLabel, *_artistNameLabel, *_soundEffectsTitleLabel, *_explosionRecorderLabel, *_popRecorderLabel,
    *_musicTitleLabel, *_musicianLabel;
    
    Background *background;
}

//set the background
- (void)setBackground;

//change scene
- (void)playGame;
- (void)back;

@end
