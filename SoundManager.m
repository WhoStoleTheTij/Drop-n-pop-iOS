//
//  SoundManager.m
//  Drop'n'Pop
//
//  Created by Richard Hall on 22/07/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager


+ (id)sharedManager{
    static SoundManager *soundManager = nil;
    @synchronized(self){
        if(soundManager == nil){
            soundManager = [[self alloc]init];
        }
    }
    return soundManager;
}


- (void)playGameSound{
    gamePlaying = TRUE;
    if(menuPlaying){
        [_menuSound stop];
        menuPlaying = FALSE;
    }
    [_gameSound prepareToPlay];
    _gameSound.numberOfLoops = -1;
    [_gameSound play];
    
}

- (void)playMenuSound{
    menuPlaying = TRUE;
    if(gamePlaying){
        [_gameSound stop];
        gamePlaying = FALSE;
    }
    [_menuSound prepareToPlay];
    _menuSound.numberOfLoops = -1;
    [_menuSound play];
}

- (id)init{
    if(self == [super init]){
        NSURL *menu = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Game-Menu_v001" ofType:@"mp3"]];
        NSURL *game = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Whimsical-Popsicle" ofType:@"mp3"]];
        _menuSound = [[AVAudioPlayer alloc]initWithContentsOfURL:menu error:nil];
        _gameSound = [[AVAudioPlayer alloc]initWithContentsOfURL:game error:nil];
    }
    return self;
}

@end
