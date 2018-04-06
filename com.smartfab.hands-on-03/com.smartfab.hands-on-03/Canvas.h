//
//  Canvas.h
//  com.smartfab.hands-on-03
//
//  Created by Gabriele on 14/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"

@interface Canvas : NSObject

@property (readonly) double totalSurface;

-(void)addRectangle:(Rectangle*)r;
-(void)addCircle:(Circle*)c;

@end
