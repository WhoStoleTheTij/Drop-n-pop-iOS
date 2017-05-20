//
//  ScoreScene.h
//  DropNPop
//
//  Created by Richard Hall on 07/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Background.h"
#import "ScoreManager.h"

@interface ScoreScene : CCNode{
    CCButton *_backButton;
    
    
    NSMutableArray *_scores;
    
    CGSize winSize;
    
    ScoreManager *_scoreManager;
    
    Background *background;
    
    CCColor *color;
    
    
}


- (void)setTheScene;

//scene changes
- (void)returnToMenu;
- (void)openCreditScene;

@end
