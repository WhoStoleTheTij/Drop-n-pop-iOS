//
//  ScoreManager.h
//  DropNPop
//
//  Created by Richard Hall on 08/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerScore.h"

static NSMutableArray *_scores;

@interface ScoreManager : NSObject{
    NSString *_documentPath;
}

- (void)checkForScoreFile;
- (void)saveScores;
- (void)getScores;
- (void)checkNewScore: (int)score;
- (NSMutableArray *)returnScores;

@end
