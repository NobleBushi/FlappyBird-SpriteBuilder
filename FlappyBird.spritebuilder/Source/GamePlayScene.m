#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObsticle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    // Increment time since the last obsticle was added
    timeSinceObsticle += delta; //delta is approx. 1/60th sec
    
    if (timeSinceObsticle > 2.0f)   // check to see if 2 seconds have passed
    {
        [self addObstacle];         // add a new obsticle
        timeSinceObsticle = 0.0f;       // then reset the timer
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // -This will get called every time the player touches the screen
    [character flap];
}
@end
