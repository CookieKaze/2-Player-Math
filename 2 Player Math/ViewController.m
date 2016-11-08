//
//  ViewController.m
//  2 Player Math
//
//  Created by Erin Luu on 2016-11-07.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player1Label;
@property (weak, nonatomic) IBOutlet UILabel *player2Label;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *player2Lives;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *input;
@property (nonatomic, strong) GameModel * gm;
@property (nonatomic, strong) NSString * answer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set question
    [self.gm generateRandomQuestion];
    self.question.text = self.gm.currentQuestion;
    
    //Set player lives and scores
    self.player1Score.text = @"0";
    self.player2Score.text = @"0";
    self.player1Lives.text = @"OOO";
    self.player2Lives.text = @"OOO";
    self.player1Label.text = @"> Player 1:";
    self.answer = @"";
    
}

// Lazy init game model
-(GameModel *) gm {
    if (!_gm) {
        _gm= [GameModel new];
    }
    return _gm;
}

- (IBAction)button1:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"1"];
    [self outputInput];
}
- (IBAction)button2:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"2"];
    [self outputInput];
}
- (IBAction)button3:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"3"];
    [self outputInput];
}
- (IBAction)button4:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"4"];
    [self outputInput];
}
- (IBAction)button5:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"5"];
    [self outputInput];
}
- (IBAction)button6:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"6"];
    [self outputInput];
}
- (IBAction)button7:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"7"];
    [self outputInput];
}
- (IBAction)button8:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"8"];
    [self outputInput];
}
- (IBAction)button9:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"9"];
    [self outputInput];
}
- (IBAction)button0:(UIButton *)sender {
    self.answer = [self.answer stringByAppendingString:@"0"];
    [self outputInput];
}
- (IBAction)buttonEnter:(UIButton *)sender {
    Player * player = [self.gm checkAnswer:self.answer];
    if ([player.name isEqualToString:@"player1"]) {
        self.player1Score.text = [NSString stringWithFormat:@"%d", player.score];
        NSString * lives = @"";
        for (int x = 0; x < player.currentLives; x++) {
            lives = [lives stringByAppendingString:@"O"];
        }
        self.player1Lives.text = lives;
    }else {
        self.player2Score.text = [NSString stringWithFormat:@"%d", player.score];
        NSString * lives = @"";
        for (int x = 0; x < player.currentLives; x++) {
            lives = [lives stringByAppendingString:@"O"];
        }
        self.player2Lives.text = lives;
    }
    [self clearInput];
    [self.gm generateRandomQuestion];
    self.question.text = self.gm.currentQuestion;
    self.answer = @"";
    [self setCurrentPlayer:player];
    [self checkGameOver: player];
}

-(void) setCurrentPlayer: (Player *) player {
    if ([player.name isEqualToString:@"player1"]) {
        self.player1Label.text = @"   Player 1:";
        self.player2Label.text = @"> Player 2:";
    }else{
        self.player1Label.text = @"> Player 1:";
        self.player2Label.text = @"   Player 2:";
    }
    
}

-(void) outputInput {
    self.input.text = self.answer;
}

-(void) clearInput {
    self.input.text = @"0";
}

-(void) checkGameOver: (Player *) player {
    if (player.gameOver==YES) {
        NSString * message = [NSString stringWithFormat:@"%@ lost!", player.name];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        [self.gm reset];
        self.question.text = self.gm.currentQuestion;
        
        //Set player lives and scores
        self.player1Score.text = @"0";
        self.player2Score.text = @"0";
        self.player1Lives.text = @"OOO";
        self.player2Lives.text = @"OOO";
        self.player1Label.text = @"> Player 1:";
        self.answer = @"";
    }
}

@end
