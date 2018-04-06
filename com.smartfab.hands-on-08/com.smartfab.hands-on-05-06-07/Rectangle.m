//
//  Rectangle.m
//  com.smartfab.hands-on-03
//
//  Created by Gabriele on 14/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "Rectangle.h"

@interface Rectangle()

@property (readwrite) int x;
@property (readwrite) int y;
@property (readwrite) int width;
@property (readwrite) int height;

@end

@implementation Rectangle

-(instancetype)initWithX:(int)x y:(int)y width:(int)width height:(int)height {
    if(self = [super init]) {
        self.x = x;
        self.y = y;
        self.height = height;
        self.width = width;
    }
    return self;
}

-(double)surface {
    return self.width * self.height;
}

@end
