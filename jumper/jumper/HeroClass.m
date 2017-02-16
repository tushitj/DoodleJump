//
//  HeroClass.m
//  jumper
//
//  Created by Tushit Jain on 2/15/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "HeroClass.h"

@implementation HeroClass
+(id)hero{
//HeroClass * hero = [HeroClass spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(50,50)];
    HeroClass * hero = [HeroClass spriteNodeWithImageNamed:@"stickMan"];
    hero.position = CGPointMake(-100, -250);
    hero.xScale = 0.1;
    hero.yScale = 0.1;
    return hero;
}


@end
