//
//  SoundManager.h
//  Drop'n'Pop
//
//  Created by Richard Hall on 22/07/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

static AVAudioPlayer *_menuSound, *_gameSound;
static BOOL menuPlaying, gamePlaying;

@interface SoundManager : NSObject{
   
    
    
}

- (void)playMenuSound;
- (void)playGameSound;


+ (id)sharedManager;

@end
