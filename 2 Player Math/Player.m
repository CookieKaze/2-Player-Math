//
//  Player.m
//  2 Player Math
//
//  Created by Erin Luu on 2016-11-07.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName: (NSString*) name
{
    self = [super init];
    if (self) {
        _score = 0;
        _currentLives = 3;
        _name = name;
        _gameOver = NO;
    }
    return self;
}

-(void) increaseScore{
    self.score ++;
}

-(void) decreaseLives{
    self.currentLives --;
    if (self.currentLives == 0) {
        self.gameOver = YES;
    }
}
@end
