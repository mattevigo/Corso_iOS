//
//  Circle.m
//  com.smartfab.hands-on-03
//
//  Created by Gabriele on 14/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "Circle.h"

@interface Circle()

@property (readwrite) int x;
@property (readwrite) int y;
@property (readwrite) int radius;

@end

@implementation Circle

-(instancetype)initWithX:(int)x y:(int)y radius:(int)radius {
    if(self = [super init]) {
        self.x = x;
        self.y = y;
        self.radius = radius;
    }
    return self;
}

-(double)surface {
    return _radius * _radius * M_PI;
}

@end
