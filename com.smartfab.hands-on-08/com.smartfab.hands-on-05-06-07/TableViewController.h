//
//  TableViewController.h
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 27/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDataSource>

-(void)didFinishAddingRectangleWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height;

-(void)didFinishAddingCircleWithX:(int)x andY:(int)y andRadius:(int)radius;

@end
