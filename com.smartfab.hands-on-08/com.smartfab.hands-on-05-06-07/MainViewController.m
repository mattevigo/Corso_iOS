//
//  CanvasViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 15/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "MainViewController.h"
#import "Rectangle.h"
#import "Circle.h"
#import "AddInputViewController.h"
#import "CanvasAndTablePageViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    bool pressedAddCircle;
    CanvasAndTablePageViewController* vc;
    __weak IBOutlet NSLayoutConstraint *buttonsFromBottom;
    __weak IBOutlet NSLayoutConstraint *buttonsFromBottomInitial;
    __weak IBOutlet NSLayoutConstraint *button2Width;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadShapes];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    buttonsFromBottomInitial.priority = 100;
    buttonsFromBottom.priority = 999;
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)addRectangleDidTouch:(id)sender {
    pressedAddCircle = false;
    [self performSegueWithIdentifier:@"toInputScreen" sender:self];
    
//    Rectangle* r = [[Rectangle alloc] initWithX:x y:y width:w height:h];
//    [self addRectangle:r];
//    [self updateShapeCount];
}

- (IBAction)addCircleDidTouch:(id)sender {
    pressedAddCircle = true;
    [self performSegueWithIdentifier:@"toInputScreen" sender:self];
//    Circle* c = [[Circle alloc] initWithX:100 y:100 radius:40];
//    [self addCircle:c];
//    [self updateShapeCount];
}

-(void)didFinishAddingRectangleWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height {
    [vc didFinishAddingRectangleWithX:x andY:y andWidth:width andHeight:height];
    
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* arr = [defs objectForKey:@"SAVED_SHAPES"];
    if(arr == nil)
        arr = [NSArray array];
    NSMutableArray* mutableArr = [arr mutableCopy];
    [mutableArr addObject:@{
                            @"x": @(x),
                            @"y": @(y),
                            @"width": @(width),
                            @"height": @(height)
                            }];
    [defs setObject:mutableArr forKey:@"SAVED_SHAPES"];
    [defs synchronize];
}

-(void)didFinishAddingCircleWithX:(int)x andY:(int)y andRadius:(int)radius {
    [vc didFinishAddingCircleWithX:x andY:y andRadius:radius];
    
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* arr = [defs objectForKey:@"SAVED_SHAPES"];
    if(arr == nil)
        arr = [NSArray array];
    NSMutableArray* mutableArr = [arr mutableCopy];
    [mutableArr addObject:@{
                            @"x": @(x),
                            @"y": @(y),
                            @"radius": @(radius)
                            }];
    [defs setObject:mutableArr forKey:@"SAVED_SHAPES"];
    [defs synchronize];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toInputScreen"]) {
        AddInputViewController* vc =  (AddInputViewController*)segue.destinationViewController;
        vc.askedToAddCircle = pressedAddCircle;
        vc.caller = self;
    }
    else if([segue.identifier isEqualToString:@"embedPagesController"]) {
        vc = (CanvasAndTablePageViewController*)segue.destinationViewController;
    }
}

-(void)loadShapes {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SAVED_SHAPES"];
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"SAVED_SHAPES"] != nil) {
        NSArray* arr = [[NSUserDefaults standardUserDefaults] objectForKey:@"SAVED_SHAPES"];
        for(NSDictionary* el in arr) {
            if(el[@"radius"]) {
                [vc didFinishAddingCircleWithX:[el[@"x"] intValue] andY:[el[@"y"] intValue] andRadius:[el[@"radius"] intValue]];
            }
            else {
                [vc didFinishAddingRectangleWithX:[el[@"x"] intValue] andY:[el[@"y"] intValue] andWidth:[el[@"width"] intValue] andHeight:[el[@"height"] intValue]];
            }
        }
    }
}

@end
