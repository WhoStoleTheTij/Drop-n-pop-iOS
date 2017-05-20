//
//  ScoreScene.m
//  DropNPop
//
//  Created by Richard Hall on 07/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "ScoreScene.h"

@implementation ScoreScene

- (void)didLoadFromCCB{
    winSize = [[CCDirector sharedDirector]viewSize];
    _scoreManager = [[ScoreManager alloc]init];
    [_scoreManager checkForScoreFile];
    
    [_backButton setZOrder:10];
    
    
    _scores = [_scoreManager returnScores];
    
    [self setTheScene];
    float yPosition = 0.90f;
    NSArray *array = [_scores sortedArrayUsingSelector:@selector(compare:)];
    array = [[array reverseObjectEnumerator]allObjects];
    
        for(PlayerScore *ps in array){
            CCLabelTTF *label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", ps.score.intValue] fontName:@"HeadlineOneHPLHS" fontSize:14];
            label.position = ccp((winSize.width * 0.5) - (label.contentSize.width / 2), winSize.height * yPosition);
            color = [CCColor colorWithRed:0.191f green:0.255f blue:0.255f];
            label.color = color;
            yPosition -= 0.09;
            [self addChild:label z:10];
        }
}


- (void)setTheScene{
    //add the background
    background = [[Background alloc]initWithMenu:TRUE];
    [self addChild:background z:-1];
}

//scene changes
- (void)returnToMenu{
    CCScene *scene = (CCScene*)[CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}

- (void)openCreditScene{
    CCScene *scene = (CCScene*)[CCBReader loadAsScene:@"CreditScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}

@end
