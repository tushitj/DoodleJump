//
//  GameScene.m
//  jumper
//
//  Created by Tushit Jain on 2/12/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "GameScene.h"
#import "HeroClass.h"
#import "WorldGenerator.h"
@interface GameScene (){
    HeroClass * hero;
    SKNode * world;
    WorldGenerator * generator;
}

@property BOOL isStarted;
@property BOOL isGameOver;
@property NSTimer *myTimer;

@end

@implementation GameScene

//-(id) initWithSize:(CGSize)size{
//   // if(self =[self initWithSize:size]){
//        }


- (void)didMoveToView:(SKView *)view {
    self.anchorPoint=CGPointMake(0.5, 0.5);
    self.backgroundColor = [SKColor colorWithRed:1.5 green:2.0 blue:0.8 alpha:1.0];
    world = [SKNode node];
    [self addChild:world];
    
    generator = [WorldGenerator generatorWorld:world];
    [self addChild:generator];
    [generator populate];
    
    hero = [HeroClass hero];
    [world addChild:hero];
    //}
    //return self;

}


-(void)didSimulatePhysics{
    [self centerOnNode:hero];
}

-(void)centerOnNode:(SKNode *)node{
    CGPoint positionInScene = [self convertPoint:node.position fromNode:node.parent];
    world.position = CGPointMake(world.position.x - positionInScene.x, world.position.y);
}

-(void)clear{
    
}

-(void)start{
    self.isStarted = YES;
    [hero start];
}

-(void)gameOver{
    
}

- (void)touchDownAtPoint:(CGPoint)pos {

}

- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!self.isStarted)
       [self start];
    else if(self.isGameOver)
        [self clear];
    else
    [hero jumper];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
//    float height = self.frame.size.height;
//    float width = self.frame.size.width;
//     [generator populate:height yIs:width];
//    
}

@end
