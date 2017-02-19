//
//  WorldGenerator.m
//  jumper
//
//  Created by Tushit Jain on 2/17/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "WorldGenerator.h"

@interface WorldGenerator()
@property double currentGroundX;
@property double currentObstacleX;
@property SKNode * world;
//@property double currentGroundY;
//@property double currentObstacleY;


@end
@implementation WorldGenerator

+(id)generatorWorld:(SKNode *)world
{
    WorldGenerator * generator = [WorldGenerator node];
    generator.currentGroundX = 0;
    generator.currentObstacleX = 400;
    generator.world = world;
    return generator;
}





-(void)populate{
    for(int i = 0; i< 3; i++){
        [self generate];
    }
}

-(void)generate{
        //= [[SKSpriteNode alloc] init];
    SKSpriteNode * ground =  [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(self.scene.frame.size.width,100)];
    ground.position = CGPointMake(0, -self.scene.frame.size.height/2 + ground.frame.size.height/2);
    
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    [self.world addChild:ground];
    
    //self.currentGroundX += ground.frame.size.width;

}

@end
