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
    HeroClass * hero = [HeroClass spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(40,40)];
    hero.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:hero.size];
   // hero.physicsBody.dynamic = YES;
    return hero;
}

-(void)jumper{
    [self.physicsBody applyImpulse:CGVectorMake(0, 40)];
}

-(void)start{
    SKAction *incrementRight = [SKAction moveByX:1 y:0 duration:0.03];
    SKAction *moveRight = [SKAction repeatActionForever:incrementRight];
    [self runAction:moveRight];
}


@end
