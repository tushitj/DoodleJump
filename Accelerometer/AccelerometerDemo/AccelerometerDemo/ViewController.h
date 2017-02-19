//
//  ViewController.h
//  AccelerometerDemo
//
//  Created by Tushit Jain on 2/18/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
@interface ViewController : UIViewController{
    CMMotionManager *motion;
    NSOperationQueue *operation;
    NSTimer *timer;
    
}

@property (weak,atomic) IBOutlet UILabel *accX;
@property (weak,atomic) IBOutlet UILabel *accY;
@property (weak,atomic) IBOutlet UILabel *accZ;
@property (weak,atomic) IBOutlet UILabel *rollLabel;
@property (weak,atomic) IBOutlet UILabel *pitchLabel;
@property (weak,atomic) IBOutlet UILabel *yawLable;


@end

