//
//  Rectangle.h
//  com.smartfab.hands-on-03
//
//  Created by Gabriele on 14/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapeDelegate.h"

@interface Rectangle : NSObject<ShapeDelegate>

@property (readonly) int x;
@property (readonly) int y;
@property (readonly) int width;
@property (readonly) int height;

-(instancetype)initWithX:(int)x y:(int)y width:(int)width height:(int)height;

@end
