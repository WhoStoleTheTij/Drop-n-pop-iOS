//
//  GameScene.h
//  Lets_Bounce
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Ball.h"
#import "StandardBall.h"
#import "BonusBall.h"
#import "Bombball.h"
#import "Ground.h"
#import "Background.h"
#import "GameOver.h"
#import "ScoreManager.h"
#import "iAdHelper.h"
#import "SoundManager.h"
#import "LargeCloud.h"
#import "SmallCloud.h"

@interface GameScene : CCNode <ADBannerViewDelegate>{
    
    CGSize winSize;
    
    bool assetsLoaded;
    bool isGameOver;
    
    int level, touchCount, ballCount, score;
    double repeatTime;
    float speed;
    
    NSMutableArray *ballsInPlay;
    NSMutableArray *xPlaces;
    
    Background *background;
    Ground *ground;
    ScoreManager *_scoreManager;
    CCSprite *scoreImage;
    
    __weak CCNode *gameOver;
    
    __weak CCScene *gameScene;
    
    LargeCloud *_largeCloud1, *_largeCloud2;
    
    SmallCloud *_smallCloud1, *_smallCloud2;
    
    ADBannerView *bannerView;
    
}

@property CCLabelTTF *scoreLabel;


- (void)setTheScoreLabel: (int)score;//done
- (void)startGameWithTime;//done
- (void)setUpTheGame;//done
- (void)gameIsOver;//done
- (void)addAPoint;//done
- (void)addThreePoints;//done
- (void)subtractTenPoints;//done
- (void)setBallsInPlay;//done
- (void)ballTouched;//done
- (void)levelUp;//done
- (void)populateXPlaces;//done
- (void)setTheScore;//done

- (void)replayGame;

@end
