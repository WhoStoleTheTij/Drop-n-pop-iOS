//
//  HowToScene.m
//  DropNPop
//
//  Created by Richard Hall on 08/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "HowToScene.h"

@implementation HowToScene

- (void)didLoadFromCCB{
    
    [_backButton setZOrder:10];
    [_playButton setZOrder:10];
    
    [self setTheScreen];
    
    [_instructionLabel setZOrder:10];
    [_demoSprite setZOrder:10];
    [_instructionLabel setFontName:@"HeadlineOneHPLHS"];
    [_instructionLabel setFontColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
}



- (void)setTheScreen{
    //add the background
    background = [[Background alloc]initWithMenu:true];
    [self addChild:background z:0];
    
}

//change scene
- (void)returnToMenu{
    CCScene *scene = (CCScene *)[CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}

- (void)playGame{
    CCScene *scene = (CCScene *)[CCBReader loadAsScene:@"GameScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}


@end
