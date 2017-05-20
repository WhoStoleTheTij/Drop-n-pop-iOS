//
//  GameOver.h
//  DropNPop
//
//  Created by Richard Hall on 07/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"
#import "ScoreManager.h"

@interface GameOver : CCNode{
    CCNode *gameOver;
}

- (void)replayGame;
- (void)changeToMenu;
@end
