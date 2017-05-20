//
//  GameScene.m
//  Drop N Pop
//
//  Created by Richard Hall on 07/05/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene


- (void)didLoadFromCCB{
    ballsInPlay = [NSMutableArray array];
    xPlaces = [NSMutableArray array];
    _scoreManager = [[ScoreManager alloc]init];
    [_scoreManager checkForScoreFile];
    
    winSize = [[CCDirector sharedDirector]viewSize];
    
    level = 1;
    touchCount = 0;
    score = 0;
    ballCount = 5;
    repeatTime = 1.0;
    speed = 2.8f;
    isGameOver = false;
    
    [self setUpTheGame];
    [self setBallsInPlay];
    [self startGameWithTime];
    
    SoundManager *_soundManager = [SoundManager sharedManager];
    [_soundManager playGameSound];
    
    //set up notification
    ////SOME NOTIFICATIONS
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAPoint) name:@"AddOnePointNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addThreePoints) name:@"AddThreePointNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subtractTenPoints) name:@"SubtractTenPoints" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ballTouched) name:@"BallWasTouched" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameIsOver) name:@"GameOver" object:nil];
    
    [iAdHelper sharedHelper];
    [iAdHelper setBannerPosition:BOTTOM];
    
    
}


//initialise
- (id)init{
    if(self = [super init]){
                
    }
    return self;
}

//set the screen
- (void)setUpTheGame{
    [self removeChild:gameOver];
    //add the background
    background = [[Background alloc]initWithMenu:false];
    [self addChild:background z:0];
    
    //add the ground
    ground = [[Ground alloc]init];
    [self addChild:ground z:1];
    
    //add the clouds
    _largeCloud1 = [[LargeCloud alloc]initAtYPosition:winSize.height * 0.85];
    [self addChild:_largeCloud1];
    [_largeCloud1 moveCloud];
    
    _largeCloud2 = [[LargeCloud alloc]initAtYPosition:winSize.height * 0.75];
    [self addChild:_largeCloud2];
    [_largeCloud2 scheduleOnce:@selector(moveCloud) delay:20.0f];
    
    _smallCloud1 = [[SmallCloud alloc]initAtYPosition:winSize.height * 0.30];
    [self addChild:_smallCloud1];
    [_smallCloud1 scheduleOnce:@selector(moveCloud) delay:16.0f];
    
    _smallCloud2 = [[SmallCloud alloc]initAtYPosition:winSize.height * 0.20];
    [self addChild:_smallCloud2];
    [_smallCloud2 scheduleOnce:@selector(moveCloud) delay:30.0f];
    
    //add the code for the creation of the score label and the game over splash screen
    [self setTheScore];
    
}

- (void)setTheScore{
    scoreImage = (CCSprite *)[CCBReader load:@"ScoreImage"];
    scoreImage.anchorPoint = CGPointZero;
    [scoreImage setZOrder:1000];
    scoreImage.position = ccp(winSize.width - (scoreImage.contentSize.width + 60), winSize.height - (scoreImage.contentSize.height + 20));
    [self addChild:scoreImage];
    
    _scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", 0] fontName:@"HeadlineOneHPLHS" fontSize:12.0f];
    _scoreLabel.fontColor = [CCColor blackColor];
    _scoreLabel.position = ccp(scoreImage.position.x + (scoreImage.contentSize.width / 2) + 8, scoreImage.position.y + 1);
    [_scoreLabel setZOrder:1001];
    [self addChild:_scoreLabel];
}

//set the score label
- (void)setTheScoreLabel:(int)newScore{
    [_scoreLabel setString:[NSString stringWithFormat:@"%i", newScore]];
}

//game over
- (void)gameIsOver{
    isGameOver = true;
    
    for(int i = 0; i < [ballsInPlay count]; i++){
        [[ballsInPlay objectAtIndex:i] gameOver];
        if([[ballsInPlay objectAtIndex:i] getYPosition] > winSize.height){
            [[ballsInPlay objectAtIndex:i]removeFromParentAndCleanup:YES];
        }
    }
    [ballsInPlay removeAllObjects];
        
    gameOver = [CCBReader load:@"GameOver"];
    [gameOver setZOrder:1000];
    if(isGameOver){
        [_scoreManager checkNewScore:score];
    }
    isGameOver = false;
    [self addChild:gameOver];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)replayGame{
    
    gameScene = [CCBReader loadAsScene:@"GameScene"];
    [[CCDirector sharedDirector]replaceScene:gameScene];
}

//add one point after standard ball is touched
- (void)addAPoint{
    score += 1;
    if(score <= 0){
        //gameover
        [self setTheScoreLabel:0];
        [self gameIsOver];
    }else{
        [self setTheScoreLabel:score];
    }
}

//add five points after bonus ball is touched
- (void)addThreePoints{
    score += 3;
    if(score <= 0){
        //gameover
        [self setTheScoreLabel:0];
        [self gameIsOver];
        
    }else{
        [self setTheScoreLabel:score];
    }
}

- (void)subtractTenPoints{
    score -= 10;
    if(score <= 0){
        [self setTheScoreLabel:0];
        [self gameIsOver];
    }else{
        [self setTheScoreLabel:score];
    }
}

//level up the game
-(void)levelUp{
    touchCount = 0;
    ballCount += 5;
    if(speed > 1.0f){
        speed -= 0.1f;
    }else{
        speed = 1.0f;
    }
    
    [self setBallsInPlay];
    [self startGameWithTime];
}

- (void)ballTouched{
    ++touchCount;
    if(touchCount == ballCount){
        [self levelUp];
    }
}

//set the balls in play
- (void)setBallsInPlay{
    [ballsInPlay removeAllObjects];
    [self populateXPlaces];
    int type = arc4random_uniform(100);
        for(int i = 0; i < ballCount; i++){
            if(type >= 45 && type <= 50){
                //add a bonus ball
                NSInteger n = [xPlaces count];
                NSInteger index = arc4random() % n;
                NSNumber *num = [xPlaces objectAtIndex:index];
                BonusBall *ball = [[BonusBall alloc]initAtXposition:[num intValue]];
                ball.speed = speed;
                [self addChild:ball];
                [ballsInPlay addObject:ball];
                type = arc4random_uniform(100);
            }else if(type == 29 || type == 31 || type == 56 || type == 84){
                //add a bomb ball
                NSInteger n = [xPlaces count];
                NSInteger index = arc4random() % n;
                NSNumber *num = [xPlaces objectAtIndex:index];
                BombBall *ball = [[BombBall alloc]initAtXposition:[num intValue]];
                ball.speed = speed;
                [self addChild:ball];
                [ballsInPlay addObject:ball];
                type = arc4random_uniform(100);
            }else{
                //add a standard ball
                NSInteger n = [xPlaces count];
                NSInteger index = arc4random() % n;
                NSNumber *num = [xPlaces objectAtIndex:index];
                StandardBall *ball = [[StandardBall alloc]initAtXposition:[num intValue]];
                ball.speed = speed;
                [self addChild:ball];
                [ballsInPlay addObject:ball];
                type = arc4random_uniform(100);
            }

        
    }
    
}

- (void)startGameWithTime{
    double time = 1.0;
    for(int i = 0; i < [ballsInPlay count]; i++){
            
        [[ballsInPlay objectAtIndex:i] scheduleOnce:@selector(launchBall) delay:time];
        time += 0.3;
    }
}

//populate the xPlaces
- (void)populateXPlaces{
    int count = 20;
    for(int i = 0; i < (winSize.width - 40) / 115; i++){
        [xPlaces addObject:[NSNumber numberWithInt:count]];
        count += 115;
    }
}

- (void)dealloc{
    
}




@end
