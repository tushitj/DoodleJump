//
//  GameViewController.m
//  myDoodle
//
//  Created by Tushit Jain on 2/19/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
#import "GameViewController.h"
//#define degrees(x) 180 * x / M_PI
@interface GameViewController (){
    CMMotionManager *motion;
    NSOperationQueue *operation;
    //NSTimer *timer;
    int score;
}
@end
@implementation GameViewController
//INTERAKTIVITA (Naprogramovanie klikatelnej casti
-(void) touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"Touch Happened.");
}
-(void)read{
    CMAttitude *attitude;
    CMDeviceMotion * motionDevice = motion.deviceMotion;
    attitude = motionDevice.attitude;
    //_rollLabel.text = roll;
    //NSLog(@" %f" , attitude.roll);
    //UITouch * tuknutie = [touches anyObject];
    //CGPoint bod = [tuknutie locationInView:self.view];
    if (attitude.roll > 0.01) {
        moveBallRight = YES;
    }
    else if(attitude.roll < -0.01) {
        moveBallLeft = YES;
    }
    else{
        moveBallLeft = NO;
        moveBallRight = NO;
        stopMovement = YES;
    }
}
//-(void) touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    moveBallLeft = NO;
//    moveBallRight = NO;
//    stopMovement = YES;
//}
//HLAVNY SPUSTAC
- (void)viewDidLoad {
    [super viewDidLoad];
    score = 0;
    motion = [[CMMotionManager alloc] init];
    motion.deviceMotionUpdateInterval = 1/60;
    [motion startDeviceMotionUpdates];
    _timer = [NSTimer scheduledTimerWithTimeInterval:(1/60) target:self selector:@selector(read) userInfo:nil repeats:YES];
    if([motion isGyroAvailable]){
        if([motion isGyroActive]){
            [motion setGyroUpdateInterval:(0.01)];
        }}
    // Do any additional setup after loading the view.
    _label2.hidden = YES;
    _label3.hidden = YES;
    _label4.hidden = YES;
    _label5.hidden = YES;
    _label6.hidden = YES;
    _labelBack.hidden = YES;
    _gameOverLabel.hidden = YES;
    _gameOverMenu.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionStart:(id)sender {
    _startButton.hidden = YES;
    upMovement = -5;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Pohyb) userInfo:nil repeats:YES];
    _label2.hidden = NO;
    _label3.hidden = NO;
    _label4.hidden = NO;
    _label5.hidden = NO;
    _label6.hidden = NO;
    number = arc4random()%206;
    number = number + 50;
    _label2.center = CGPointMake(number, 546);
    number = arc4random()%206;
    number = number + 50;
    _label3.center = CGPointMake(number, 449);
    number = arc4random()%206;
    number = number + 50;
    _label4.center = CGPointMake(number, 336);
    number = arc4random()%206;
    number = number + 50;
    _label5.center = CGPointMake(number, 231);
    number = arc4random()%206;
    number = number + 50;
    _label6.center = CGPointMake(number, 126);
    platform3motion = 2;
    platform5motion = -2;
}
-(void)PlatformPad {
    if (_labelBall.center.y > 500) {
        padaniePlatformy = 3;
    } else if (_labelBall.center.y > 450) {
        padaniePlatformy = 7;
    } else if (_labelBall.center.y > 400) {
        padaniePlatformy = 10;
    } else if (_labelBall.center.y > 300) {
        padaniePlatformy = 11;
    } else if (_labelBall.center.y > 250) {
        padaniePlatformy = 14;
    }
}
//HLAVNY POHYB
-(void) Pohyb {
    [self motionPlatformY];
    _labelBall.center = CGPointMake(_labelBall.center.x + sideMovement, _labelBall.center.y - upMovement);
    if (_labelBall.center.y < 100) {
        _labelBall.center = CGPointMake(_labelBall.center.x, 100);
    }
    //    INTERSECT, odrazenie od platformy.
    if ((CGRectIntersectsRect(_labelBall.frame, _label1.frame)) && (upMovement < -2) ) {
        [self Bounce];
        [self PlatformPad];
    }
    if ((CGRectIntersectsRect(_labelBall.frame, _label2.frame)) && (upMovement < -2) ) {
        [self Bounce];
        [self PlatformPad];
    }
    if ((CGRectIntersectsRect(_labelBall.frame, _label3.frame)) && (upMovement < -2) ) {
        [self Bounce];
        [self PlatformPad];
    }
    if ((CGRectIntersectsRect(_labelBall.frame, _label4.frame)) && (upMovement < -2) ) {
        [self Bounce];
        [self PlatformPad];
    }
    if ((CGRectIntersectsRect(_labelBall.frame, _label5.frame)) && (upMovement < -2) ) {
        [self Bounce];
        [self PlatformPad];
    }
    if ((CGRectIntersectsRect(_labelBall.frame, _label6.frame)) && (upMovement < -2) ) {
        [self Bounce];
        [self PlatformPad];
    }
    if([[UIScreen mainScreen] bounds].size.height < _labelBall.frame.origin.y){
        // GAME OVER LOGIC
        _labelBall.hidden = YES;
        _label1.hidden = YES;
        _label2.hidden = YES;
        _label3.hidden = YES;
        _label4.hidden = YES;
        _label5.hidden = YES;
        _label6.hidden = YES;
        _gameOverLabel.hidden = NO;
        _gameOverMenu.hidden = NO;
    }
    upMovement = upMovement - 0.3;
    if (moveBallLeft == YES) {
        sideMovement = sideMovement - 0.2;
        if (sideMovement < -5) {
            sideMovement = -5;
        }
    }
    if (moveBallRight == YES) {
        sideMovement = sideMovement + 0.2;
        if (sideMovement > 5) {
            sideMovement = 5;
        }
    }
    if((stopMovement == YES) && (sideMovement < 0)) {
        sideMovement = sideMovement + 0.1;
        if (sideMovement > 0 ) {
            sideMovement = 0;
            stopMovement = NO;
        }
    }
    if ((stopMovement == YES) && (sideMovement > 0)) {
        sideMovement = sideMovement - 0.1;
        if (sideMovement < 0) {
            sideMovement = 0;
            stopMovement = NO;
        }
    }
    //To check if the ball is not exceeded edge
    if (_labelBall.center.x < -11) {
        _labelBall.center = CGPointMake(350, _labelBall.center.y);
    } else if (_labelBall.center.x > 350) {
        _labelBall.center = CGPointMake(-11, _labelBall.center.y);
    }
    //    KONIEC KONTROLY
}
-(void) Bounce {
    _labelBall.animationImages = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"gula2.png"],
                                  [UIImage imageNamed:@"gula3.png"],
                                  [UIImage imageNamed:@"gula2.png"],
                                  [UIImage imageNamed:@"gula.gif"], nil ];
    [_labelBall setAnimationRepeatCount:1];
    _labelBall.animationDuration = 0.2;
    [_labelBall startAnimating];
    if (_labelBall.center.y > 600) {
        upMovement = 10;
    } else if (_labelBall.center.y > 500) {
        upMovement = 9;
    } else if (_labelBall.center.y > 400) {
        upMovement = 8;
    } else {
        upMovement = 7;
    }
    score = score + 1;
    [_scorelabel setText:[NSString stringWithFormat:@"%d" , score]];
}
//POHYB PLATFORMY KOD
- (void) motionPlatformY {
    // Moving the platform to the sides and bottom (when she jumps on the platform)
    _label1.center = CGPointMake(_label1.center.x, _label1.center.y + padaniePlatformy);
    _label2.center = CGPointMake(_label2.center.x, _label2.center.y + padaniePlatformy);
    _label3.center = CGPointMake(_label3.center.x + platform3motion, _label3.center.y + padaniePlatformy);
    _label4.center = CGPointMake(_label4.center.x, _label4.center.y + padaniePlatformy);
    _label5.center = CGPointMake(_label5.center.x + platform5motion, _label5.center.y + padaniePlatformy);
    _label6.center = CGPointMake(_label6.center.x, _label6.center.y + padaniePlatformy);
    if (_label3.center.x > 320 ) {
        platform3motion = -2;
    } else if(_label3.center.x < 60) {
        platform3motion = 2;
    }
    if (_label5.center.x < 60) {
        platform5motion = 2;
    } else if (_label5.center.x > 320) {
        platform5motion = -2;
    }
    padaniePlatformy =  padaniePlatformy - 0.1;
    if (padaniePlatformy < 0) {
        padaniePlatformy = 0;
    }
    //    Nahodne generovanie novych platforiem
    if (_label1.center.y > 670 ) {
        number = arc4random()% 320;
        number = number + 50;
        _label1.center = CGPointMake(number, -6);
    }
    if (_label2.center.y > 670 ) {
        number = arc4random()% 320;
        number = number + 50;
        _label2.center = CGPointMake(number, -6);
    }
    if (_label3.center.y > 670 ) {
        number = arc4random()% 320;
        number = number + 50;
        _label3.center = CGPointMake(number, -6);
    }
    if (_label4.center.y > 670 ) {
        number = arc4random()% 320;
        number = number + 50;
        _label4.center = CGPointMake(number, -6);
    }
    if (_label5.center.y > 670 ) {
        number = arc4random()% 320;
        number = number + 50;
        _label5.center = CGPointMake(number, -6);
    }
    if (_label6.center.y > 670 ) {
        number = arc4random()% 320;
        number = number + 50;
        _label6.center = CGPointMake(number, -6);
    }
}
@end
