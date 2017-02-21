//
//  GameViewController.h
//  myDoodle
//
//  Created by Tushit Jain on 2/19/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
float upMovement;
float sideMovement;
int platform3motion;
int platform5motion;
int number;
float padaniePlatformy;

BOOL moveBallLeft;
BOOL moveBallRight;
BOOL stopMovement;


@interface GameViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *scorelabel;
@property (weak, nonatomic) IBOutlet UIImageView *labelBall;
@property (weak, nonatomic) IBOutlet UIImageView *label1;
@property (weak, nonatomic) IBOutlet UIImageView *label2;
@property (weak, nonatomic) IBOutlet UIImageView *label3;
@property (weak, nonatomic) IBOutlet UIImageView *label4;
@property (weak, nonatomic) IBOutlet UIImageView *label5;
@property (weak, nonatomic) IBOutlet UIImageView *label6;

@property (strong, nonatomic) NSTimer * timer;
- (IBAction)actionStart:(id)sender;

- (void) Pohyb;
- (void) Bounce;
- (void) motionPlatformY;
- (void) PlatformPad;

@end

