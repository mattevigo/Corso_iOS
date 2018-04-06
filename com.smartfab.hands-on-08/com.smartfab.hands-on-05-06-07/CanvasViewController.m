//
//  CanvasViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 27/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "CanvasViewController.h"
#import "Rectangle.h"
#import "Circle.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)didFinishAddingRectangleWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height {
    Rectangle* r = [[Rectangle alloc] initWithX:x y:y width:width height:height];
    CGRect finalFrame = CGRectMake(r.x, r.y, r.width, r.height);
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(r.x, self.view.frame.size.height, r.width, r.height)];
    v.alpha = 0;
    v.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:v];
    
    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        v.alpha = 1;
        v.frame = finalFrame;
    } completion:^(BOOL finished) {
    }];
}

-(void)didFinishAddingCircleWithX:(int)x andY:(int)y andRadius:(int)radius {
    Circle* c = [[Circle alloc] initWithX:x y:y radius:radius];
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(c.x, c.y, c.radius * 2, c.radius * 2)];
    v.layer.cornerRadius = c.radius;
    v.backgroundColor = [UIColor blueColor];
    v.alpha = 0;
    v.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    
    [self.view addSubview:v];
    
    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        v.alpha = 1;
        
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:3 delay:1 usingSpringWithDamping:0.7 initialSpringVelocity:10 options:0 animations:^{
        v.transform = CGAffineTransformIdentity;
    } completion:nil];
}


@end
