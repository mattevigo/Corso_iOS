//
//  AddRectangleInputViewController.m
//  com.smartfab.hands-on-05-06-07
//
//  Created by Gabriele on 27/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "AddInputViewController.h"

@interface AddInputViewController ()

@end

@implementation AddInputViewController {
    __weak IBOutlet UITextField *xTextField;
    __weak IBOutlet UITextField *yTextField;
    __weak IBOutlet UITextField *widthTextField;
    __weak IBOutlet UITextField *heightTextField;
    __weak IBOutlet UILabel *heightLabel;
    __weak IBOutlet UILabel *widthLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];;
    // Proprieta' che viene settata
    // dal controller che presenta questo controller
    // In questo modo possiamo decidere quali campi di input mostrare
    // E come chiamarli
    if(self.askedToAddCircle) {
        heightLabel.hidden = true;
        heightTextField.hidden = true;
        widthLabel.text = @"radius";
    }
    else {
        heightLabel.hidden = false;
        heightTextField.hidden = false;
        widthLabel.text = @"width";
    }
}

- (IBAction)doneButtonDidTouch:(id)sender {
    // Metodo che viene chiamato ogni volta che si preme il bottone done
    // Dato che il controller corrente e' stato presentato
    // con una segue "modale", per tornare indietro si usa [self dismiss] e non [self.navigationController popViewController]
    [self dismissViewControllerAnimated:true completion:^{
        // A seconda che il chiamante abbia chiesto di presentare l'input per un cerchio o per un rettangolo, si chiama il metodo delegate corrispondente
        if(self.askedToAddCircle) {
            [self.caller didFinishAddingCircleWithX:[xTextField.text intValue] andY:[yTextField.text intValue] andRadius:[widthTextField.text intValue]];
        }
        else {
            [self.caller didFinishAddingRectangleWithX:[xTextField.text intValue] andY:[yTextField.text intValue] andWidth:[widthTextField.text intValue] andHeight:[heightTextField.text intValue]];
        }
    }];
}

@end
