//
//  Player.h
//  2 Player Math
//
//  Created by Erin Luu on 2016-11-07.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSString * name;
@property (nonatomic) NSInteger currentLives;
@property (nonatomic) NSInteger score;
@property (nonatomic) BOOL gameOver;

- (instancetype)initWithName: (NSString*) name;
-(void) increaseScore;
-(void) decreaseLives;


@end
