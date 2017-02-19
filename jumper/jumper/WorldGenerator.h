//
//  WorldGenerator.h
//  jumper
//
//  Created by Tushit Jain on 2/17/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface WorldGenerator : SKNode
+(id) generatorWorld:(SKNode *)world;
-(void)populate;
-(void)generate;
@end
