//
//  MyFirstViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 15/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "MyFirstViewController.h"

@interface MyFirstViewController ()

@end

@implementation MyFirstViewController {
    
    __weak IBOutlet UIButton *myButton;
    __weak IBOutlet UIView *redBottomBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create rettangoli e cerchi qui
    //...
    
    
    // Do any additional setup after loading the view.
    self.myCenteredLabel.text = @"0";
    
    // Add a new view programmatically
    CGRect f = CGRectMake(0, 100, self.view.frame.size.width, 50);
    UIView* redView = [[UIView alloc] initWithFrame:f];
    redView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    [self.view addSubview:redView];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        NSString* testoNellaLabel = self.myCenteredLabel.text;
        int numeroCorrente = [testoNellaLabel intValue];
        numeroCorrente++;
        NSString* nuovoTestoNellaLabel = [@(numeroCorrente) stringValue];
                                          //[NSString stringWithFormat:@"%d", numeroCorrente];
        self.myCenteredLabel.text = nuovoTestoNellaLabel;
    }];
}

-(void)addRectangle {
    // Crea uiview per questo rettangolo con CGRect
    // pari alle sue dimensioni
    
    // Aggiungere a self.view
    
};
-(void)addCircle {
    // Crea uiview per questo rettangolo con CGRect
    // pari alle sue dimensioni
    
    // Aggiungere a self.view
    
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
