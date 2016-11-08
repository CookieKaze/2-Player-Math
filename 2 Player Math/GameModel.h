//
//  GameModel.h
//  2 Player Math
//
//  Created by Erin Luu on 2016-11-07.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  Player;

@interface GameModel : NSObject

@property (nonatomic) NSMutableArray * playerList;
@property (nonatomic) int currentPlayer;
@property (nonatomic) NSString * currentQuestion;
@property (nonatomic) NSInteger currentAnswer;



-(void) generateRandomQuestion;
-(Player *) checkAnswer: (NSString*) answer;
-(void) reset;

@end
