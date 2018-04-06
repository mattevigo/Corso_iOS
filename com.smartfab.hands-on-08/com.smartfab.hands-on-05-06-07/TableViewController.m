//
//  TableViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 27/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "TableViewController.h"
#import "Rectangle.h"
#import "Circle.h"

@interface TableViewController ()

@end

@implementation TableViewController {
    NSMutableArray* shapes;
    __weak IBOutlet UITableView *tv;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    shapes = [NSMutableArray array];
    tv.dataSource = self;
}

-(void)didFinishAddingRectangleWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height {
    Rectangle* r = [[Rectangle alloc] initWithX:x y:y width:width height:height];
    [shapes addObject:r];
    [tv reloadData];
}

-(void)didFinishAddingCircleWithX:(int)x andY:(int)y andRadius:(int)radius {
    Circle* c = [[Circle alloc] initWithX:x y:y radius:radius];
    [shapes addObject:c];
    [tv reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return shapes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"genericCell"];
    
    UILabel* shapeTypeLabel = [cell.contentView viewWithTag:5];
    UILabel* widthLabel = [cell.contentView viewWithTag:6];
    UILabel* heightLabel = [cell.contentView viewWithTag:7];
    
    int row = (int)indexPath.row;
    NSObject* el = shapes[row];
    if([el isKindOfClass:[Rectangle class]]) {
        Rectangle* r = (Rectangle*)el;
        
        shapeTypeLabel.text = @"Rectangle";
        
        widthLabel.hidden = false;
        widthLabel.text = [NSString stringWithFormat:@"Width: %d px", r.width];
        heightLabel.text = [NSString stringWithFormat:@"Height: %d px", r.height];
    }
    else {
        Circle* c = (Circle*)el;
        
        shapeTypeLabel.text = @"Circle";
        
        widthLabel.hidden = true;
        heightLabel.text = [NSString stringWithFormat:@"Radius: %d px", c.radius];
    }
    
    return cell;
}

@end
