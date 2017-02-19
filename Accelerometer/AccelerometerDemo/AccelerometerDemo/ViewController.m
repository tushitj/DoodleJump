//
//  ViewController.m
//  AccelerometerDemo
//
//  Created by Tushit Jain on 2/18/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "ViewController.h"
#define degrees(x) 180 * x / M_PI
@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    motion = [[CMMotionManager alloc] init];
    motion.deviceMotionUpdateInterval = 1/60;
    [motion startDeviceMotionUpdates];
    // Do any additional setup after loading the view, typically from a nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:(1/60) target:self selector:@selector(read) userInfo:nil repeats:YES];

    if([motion isGyroAvailable]){
        if([motion isGyroActive]){
            [motion setGyroUpdateInterval:(0.1)];
            [motion startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * gyroData, NSError * error) {
                NSString * x = [[NSString alloc]initWithFormat:@"%0.2f" , gyroData.rotationRate.x];
                _accX.text = x;
                NSString * y = [[NSString alloc]initWithFormat:@"%0.2f" , gyroData.rotationRate.y];
                _accY.text = y;
                NSString * z = [[NSString alloc]initWithFormat:@"%0.2f" , gyroData.rotationRate.x];
                _accZ.text = z;
                
            }];
        }
    }
    else{
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"NO GYRO" message:@"Get a gyro" delegate:self cancelButtonTitle:@"DONE" otherButtonTitles:nil];
//        [alert show];
    }
}

-(void) read{
    CMAttitude *attitude;
    CMDeviceMotion * motionDevice = motion.deviceMotion;
    attitude = motionDevice.attitude;
    
    NSString * yaw = [[NSString alloc] initWithFormat:@"Yaw :%f",degrees(attitude.yaw)];
    _yawLable.text = yaw;
    
    NSString * pitch = [[NSString alloc] initWithFormat:@"pitch :%f",degrees(attitude.pitch)];
    _pitchLabel.text = pitch;
    
    NSString * roll = [[NSString alloc] initWithFormat:@"Roll :%f",degrees(attitude.roll)];
    _rollLabel.text = roll;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
