//
//  GameOver.m
//  DropNPop
//
//  Created by Richard Hall on 07/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GameOver.h"

@implementation GameOver

- (void)didLoadFromCCB{
    
}


- (void)replayGame{
    [self unscheduleAllSelectors];
    CCScene *scene = [CCBReader loadAsScene:@"GameScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}
- (void)changeToMenu{
    
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}

@end
