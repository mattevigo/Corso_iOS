//
//  Canvas.m
//  com.smartfab.hands-on-03
//
//  Created by Gabriele on 14/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "Canvas.h"
#import "ShapeDelegate.h"

@implementation Canvas {
    NSMutableArray<id<ShapeDelegate>>* shapes;
}

-(instancetype)init {
    if(self = [super init]) {
        shapes = [NSMutableArray array];
    }
    return self;
}

-(void)addRectangle:(Rectangle *)r {
    [shapes addObject:r];
}

-(void)addCircle:(Circle *)c {
    [shapes addObject:c];
}

-(double)totalSurface {
    double surf = 0;
    for(id<ShapeDelegate> item in shapes) {
        surf += [item surface];
    }
    return surf;
}

@end
