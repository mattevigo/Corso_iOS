//
//  FinalViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 15/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "FinalViewController.h"

@interface FinalViewController ()

@end

@implementation FinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:false block:^(NSTimer * _Nonnull timer) {
        [self.navigationController popViewControllerAnimated:true];
    }];
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
