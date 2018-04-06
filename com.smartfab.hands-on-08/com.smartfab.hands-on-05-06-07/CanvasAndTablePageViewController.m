//
//  CanvasAndTablePageViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 27/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "CanvasAndTablePageViewController.h"
#import "CanvasViewController.h"
#import "TableViewController.h"

@interface CanvasAndTablePageViewController ()

@end

@implementation CanvasAndTablePageViewController {
    TableViewController* tablePage;
    CanvasViewController* canvasPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    
    tablePage = [self.storyboard instantiateViewControllerWithIdentifier:@"tableController2"];
    canvasPage = [self.storyboard instantiateViewControllerWithIdentifier:@"tableController"];
    [self setViewControllers:@[ canvasPage ] direction:UIPageViewControllerNavigationDirectionForward animated:false completion:nil];
}

-(void)didFinishAddingRectangleWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height {
    [canvasPage didFinishAddingRectangleWithX:x andY:y andWidth:width andHeight:height];
    [tablePage didFinishAddingRectangleWithX:x andY:y andWidth:width andHeight:height];
}

-(void)didFinishAddingCircleWithX:(int)x andY:(int)y andRadius:(int)radius {
    [canvasPage didFinishAddingCircleWithX:x andY:y andRadius:radius];
    [tablePage didFinishAddingCircleWithX:x andY:y andRadius:radius];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if(viewController == canvasPage)
        return tablePage;
    else
        return nil;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if(viewController == tablePage)
        return canvasPage;
    else
        return nil;
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 2;
}


@end
