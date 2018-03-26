//
//  CanvasViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 15/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "CanvasViewController.h"
#import "Rectangle.h"
#import "Circle.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController
{
    __weak IBOutlet UILabel *shapeCountLabel;
    __weak IBOutlet UIView *shapeContainer;
    __weak IBOutlet UITextField *xTextField;
    __weak IBOutlet UITextField *yTextField;
    __weak IBOutlet UITextField *widthTextField;
    __weak IBOutlet UITextField *heightTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addRectangleDidTouch:(id)sender {
    int x = [xTextField.text intValue];
    int y = [yTextField.text intValue];
    int w = [widthTextField.text intValue];
    int h = [heightTextField.text intValue];
    
    Rectangle* r = [[Rectangle alloc] initWithX:x y:y width:w height:h];
    [self addRectangle:r];
    [self updateShapeCount];
}

- (IBAction)addCircleDidTouch:(id)sender {
    Circle* c = [[Circle alloc] initWithX:100 y:100 radius:40];
    [self addCircle:c];
    [self updateShapeCount];
}

- (IBAction)doneDidTouch:(id)sender {
    [xTextField resignFirstResponder];
    [yTextField resignFirstResponder];
    [widthTextField resignFirstResponder];
    [heightTextField resignFirstResponder];
}

-(void)updateShapeCount {
    int count = (int)shapeContainer.subviews.count;
    shapeCountLabel.text = [@(count) stringValue];
    
    // Check if shape count == 2 then go to final screen
    if(count == 2) {
        [self performSegueWithIdentifier:@"canvasToFinalScreen" sender:self];
    }
}

-(void)addRectangle:(Rectangle*)r {
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(r.x, r.y, r.width, r.height)];
    v.backgroundColor = [UIColor yellowColor];
    [shapeContainer addSubview:v];
}

-(void)addCircle:(Circle*)c {
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(c.x, c.y, c.radius * 2, c.radius * 2)];
    v.layer.cornerRadius = c.radius;
    v.backgroundColor = [UIColor blueColor];
    [shapeContainer addSubview:v];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
