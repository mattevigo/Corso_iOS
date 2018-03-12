//
//  ByeByeViewController.m
//  Bye Bye World!
//
//  Created by Matteo Vigoni on 07/03/2018.
//  Copyright © 2018 Odd Jobs. All rights reserved.
//

#import "ByeByeViewController.h"

@interface ByeByeViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *_worldWidthCnstraint;

@end

@implementation ByeByeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    self._worldWidthCnstraint.constant = 0.0;
    [UIView animateWithDuration:5.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
