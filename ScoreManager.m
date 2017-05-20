//
//  ScoreManager.m
//  DropNPop
//
//  Created by Richard Hall on 08/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "ScoreManager.h"

@implementation ScoreManager

- (id)init{
    if(self = [super init]){
        _scores = [[NSMutableArray alloc]init];
        _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    }
    return self;
}

//check a new score
- (void)checkNewScore:(int)score{
    [self getScores];
    NSArray * array = [_scores sortedArrayUsingSelector:@selector(compare:)];
    if([_scores count] == 10){
        if([NSNumber numberWithInt:score] >= [[array objectAtIndex:0] score] && score > 0){
            PlayerScore *ps = [[PlayerScore alloc]initWithScore:score];
            [_scores removeObject:[array objectAtIndex:0]];
            [_scores addObject:ps];
            [self saveScores];
        }
    }else if(score > 0){
        PlayerScore *ps = [[PlayerScore alloc]initWithScore:score];
        [_scores addObject:ps];
        [self saveScores];
    }
    [_scores sortedArrayUsingSelector:@selector(compare:)];
}

//save scores
- (void)saveScores{
    NSString *scores = [NSString string];
    for(PlayerScore *p in _scores){
        if(p.score.intValue > 0){
            scores = [scores stringByAppendingFormat:@"%i,",p.score.intValue];
        }
    }
    
    if(scores != NULL){
        [scores writeToFile:[_documentPath stringByAppendingPathComponent:@"scores.csv"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
}

//get the scores
- (void)getScores{
    [_scores removeAllObjects];
    
    NSString *string = [NSString stringWithContentsOfFile:[_documentPath stringByAppendingPathComponent:@"scores.csv"] encoding:NSUTF8StringEncoding error:nil];
    if([string length] > 0){
        NSArray *strings = [string componentsSeparatedByString:@","];
        if([strings count] > 0 && ![[strings objectAtIndex:0]isEqualToString:@"0"] ){
            for(NSString *s in strings){
                if([s intValue] > 0 ){
                    PlayerScore *p = [[PlayerScore alloc]initWithScore:[s intValue]];
                    [_scores addObject:p];
                }
                
            }
        }
    }
    
}

//check the file exists
- (void)checkForScoreFile{
    
    //NSLog(@"Checking for the file");
    
    //[[NSFileManager defaultManager]removeItemAtPath:[documentPath stringByAppendingPathComponent:@"scores.txt"] error:nil];
    if(![[NSFileManager defaultManager]fileExistsAtPath:[_documentPath stringByAppendingPathComponent:@"scores.csv"] isDirectory:NULL]){
        [[NSFileManager defaultManager]createFileAtPath:[_documentPath stringByAppendingPathComponent:@"scores.csv"] contents:nil attributes:nil];
        
    }else{
        [self getScores];
        
    }
}

- (NSMutableArray *)returnScores{
    return _scores;
}



@end
