//
//  HowToScene.h
//  DropNPop
//
//  Created by Richard Hall on 08/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Background.h"

@interface HowToScene : CCNode{
    CCButton *_backButton, *_playButton;
    CCLabelTTF *_instructionLabel;
    CCSprite *_demoSprite;
    
    Background *background;
}


- (void)setTheScreen;

//scene changes
- (void)returnToMenu;
- (void)playGame;
@end
