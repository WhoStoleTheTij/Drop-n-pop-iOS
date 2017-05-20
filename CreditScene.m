//
//  CreditScene.m
//  Drop'n'Pop
//
//  Created by Richard Hall on 22/07/2015.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "CreditScene.h"


@implementation CreditScene

- (void)didLoadFromCCB{
    [self setBackground];
    
    [_artistTitleLabel setFontName:@"HeadlineOneHPLHS"];
    [_artistTitleLabel setFontSize:14.0f];
    [_artistTitleLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    [_artistNameLabel setFontName:@"HeadlineOneHPLHS"];
    [_artistNameLabel setFontSize:14.0f];
    [_artistNameLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    [_soundEffectsTitleLabel setFontName:@"HeadlineOneHPLHS"];
    [_soundEffectsTitleLabel setFontSize:14.0f];
    [_soundEffectsTitleLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    [_explosionRecorderLabel setFontName:@"HeadlineOneHPLHS"];
    [_explosionRecorderLabel setFontSize:14.0f];
    [_explosionRecorderLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    [_popRecorderLabel setFontName:@"HeadlineOneHPLHS"];
    [_popRecorderLabel setFontSize:14.0f];
    [_popRecorderLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    [_musicTitleLabel setFontName:@"HeadlineOneHPLHS"];
    [_musicTitleLabel setFontSize:14.0f];
    [_musicTitleLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    [_musicianLabel setFontName:@"HeadlineOneHPLHS"];
    [_musicianLabel setFontSize:14.0f];
    [_musicianLabel setColor:[CCColor colorWithRed:0.191f green:0.255f blue:0.255f]];
    
    
}

//set background
- (void)setBackground{
    background = [[Background alloc]initWithMenu:TRUE];
    [self addChild:background z:-1];
}

//change the scene
- (void)playGame{
    CCScene *scene = (CCScene*)[CCBReader loadAsScene:@"GameScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}

- (void)back{
    CCScene *scene = (CCScene*)[CCBReader loadAsScene:@"ScoreScene"];
    [[CCDirector sharedDirector]replaceScene:scene];
}

@end
