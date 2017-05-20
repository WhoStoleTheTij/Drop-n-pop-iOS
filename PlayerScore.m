//
//  PlayerScore.m
//  DropNPop
//
//  Created by Richard Hall on 08/06/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "PlayerScore.h"

@implementation PlayerScore

- (id)initWithScore:(int)score{
    if(self = [super init]){
        self.score = [NSNumber numberWithInt:score];
    }
    return self;
}


- (NSComparisonResult)compare:(PlayerScore *)ps{
    return [self.score compare:ps.score];
}

@end
