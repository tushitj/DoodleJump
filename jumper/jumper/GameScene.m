//
//  GameScene.m
//  jumper
//
//  Created by Tushit Jain on 2/12/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "GameScene.h"
#import "HeroClass.h"
@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.backgroundColor = [SKColor colorWithRed:1.5 green:2.0 blue:0.8 alpha:1.0];
    
    SKSpriteNode * ground =  [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(self.frame.size.width, 10)];
    ground.position = CGPointMake(0, -self.frame.size.height/2);
    [self addChild:ground];
    HeroClass * hero = [HeroClass hero];
    [self addChild:hero];

}


- (void)touchDownAtPoint:(CGPoint)pos {

}

- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
