//
//  GameViewController.m
//  myDoodle
//
//  Created by Tushit Jain on 2/19/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "GameViewController.h"
#define degrees(x) 180 * x / M_PI
@interface GameViewController (){
    CMMotionManager *motion;
    NSOperationQueue *operation;
    //NSTimer *timer;

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
    
    NSLog(@" %f" , attitude.roll);
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
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

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
    
    
    platform3pohyb = 2;
    platform5pohyb = -2;
    
}



-(void)PlatformaPad {
    
    if (_labelBall.center.y > 500) {
        padaniePlatformy = 1;
    } else if (_labelBall.center.y > 450) {
        padaniePlatformy = 2;
    } else if (_labelBall.center.y > 400) {
        padaniePlatformy = 4;
    } else if (_labelBall.center.y > 300) {
        padaniePlatformy = 5;
    } else if (_labelBall.center.y > 250) {
        padaniePlatformy = 6;
    }
}


//HLAVNY POHYB
-(void) Pohyb {
    
    [self PohybPlatformy];
    _labelBall.center = CGPointMake(_labelBall.center.x + sideMovement, _labelBall.center.y - upMovement);
    
    if (_labelBall.center.y < 100) {
        _labelBall.center = CGPointMake(_labelBall.center.x, 100);
    }
    
    
    //    INTERSECT, odrazenie od platformy.
    if ((CGRectIntersectsRect(_labelBall.frame, _label1.frame)) && (upMovement < -2) ) {
        
        [self Bounce];
        [self PlatformaPad];
    }
    
    if ((CGRectIntersectsRect(_labelBall.frame, _label2.frame)) && (upMovement < -2) ) {
        
        [self Bounce];
        [self PlatformaPad];
    }
    
    if ((CGRectIntersectsRect(_labelBall.frame, _label3.frame)) && (upMovement < -2) ) {
        
        [self Bounce];
        [self PlatformaPad];
    }
    
    if ((CGRectIntersectsRect(_labelBall.frame, _label4.frame)) && (upMovement < -2) ) {
        
        [self Bounce];
        [self PlatformaPad];
    }
    
    if ((CGRectIntersectsRect(_labelBall.frame, _label5.frame)) && (upMovement < -2) ) {
        
        [self Bounce];
        [self PlatformaPad];
    }
    
    if ((CGRectIntersectsRect(_labelBall.frame, _label6.frame)) && (upMovement < -2) ) {
        
        [self Bounce];
        [self PlatformaPad];
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
    
    //    Kontrola, ci lopta neprekrocila okraje
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
                                  [UIImage imageNamed:@"gula.png"], nil ];
    
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
    
}


//POHYB PLATFORMY KOD
- (void) PohybPlatformy {
    
    //   Pohyb platformy do stran a dole (ked skocime na platformu)
    
    _label1.center = CGPointMake(_label1.center.x, _label1.center.y + padaniePlatformy);
    _label2.center = CGPointMake(_label2.center.x, _label2.center.y + padaniePlatformy);
    _label3.center = CGPointMake(_label3.center.x + platform3pohyb, _label3.center.y + padaniePlatformy);
    _label4.center = CGPointMake(_label4.center.x, _label4.center.y + padaniePlatformy);
    _label5.center = CGPointMake(_label5.center.x + platform5pohyb, _label5.center.y + padaniePlatformy);
    _label6.center = CGPointMake(_label6.center.x, _label6.center.y + padaniePlatformy);
    
    
    if (_label3.center.x > 320 ) {
        platform3pohyb = -2;
    } else if(_label3.center.x < 60) {
        platform3pohyb = 2;
    }
    
    if (_label5.center.x < 60) {
        platform5pohyb = 2;
    } else if (_label5.center.x > 320) {
        platform5pohyb = -2;
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
