//
//  GameModel.m
//  2 Player Math
//
//  Created by Erin Luu on 2016-11-07.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerList = [NSMutableArray new];
        Player * player = [[Player alloc] initWithName:@"player1"];
        [_playerList addObject:player];
        player = [[Player alloc] initWithName:@"player2"];
        [_playerList addObject:player];
        _currentPlayer = 0;
    }
    return self;
}

-(void) generateRandomQuestion {
    int num1 = arc4random_uniform(20)+1;
    int num2 = arc4random_uniform(20)+1;
    self.currentQuestion = [NSString stringWithFormat:@"%d + %d", num1, num2];
    self.currentAnswer = num1 + num2;
}

-(Player *) checkAnswer: (NSString*) answer {
    NSString * userAnswer = answer;
    Player * currentPlayer;
    if ([userAnswer integerValue] == self.currentAnswer) {
        currentPlayer = self.playerList[self.currentPlayer];
        [currentPlayer increaseScore];
        [self.playerList setObject:currentPlayer atIndexedSubscript:self.currentPlayer];
    }else{
        currentPlayer = self.playerList[self.currentPlayer];
        [currentPlayer decreaseLives];
        [self.playerList setObject:currentPlayer atIndexedSubscript:self.currentPlayer];
    }
    if (self.currentPlayer == 0) {
        self.currentPlayer = 1;
    }else{
        self.currentPlayer = 0;
    }
    return currentPlayer;
}

-(void) reset {
    self.playerList = [NSMutableArray new];
    Player * player = [[Player alloc] initWithName:@"player1"];
    [_playerList addObject:player];
    player = [[Player alloc] initWithName:@"player2"];
    [_playerList addObject:player];
    _currentPlayer = 0;

    
}



@end
