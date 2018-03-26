//
//  Circle.h
//  com.smartfab.hands-on-03
//
//  Created by Gabriele on 14/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapeDelegate.h"

@interface Circle : NSObject<ShapeDelegate>

@property (readonly) int x;
@property (readonly) int y;
@property (readonly) int radius;

-(instancetype)initWithX:(int)x y:(int)y radius:(int)radius;

@end
