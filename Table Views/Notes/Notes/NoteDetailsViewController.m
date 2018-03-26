//
//  NoteDetailsViewController.m
//  Notes
//
//  Created by Matteo Vigoni on 26/03/2018.
//  Copyright © 2018 Odd Jobs. All rights reserved.
//

#import "NoteDetailsViewController.h"
#import "NotesModel.h"

#import <os/log.h>

@interface NoteDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation NoteDetailsViewController
{
    os_log_t _log;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _log = os_log_create("com.smartfab.notes", "NoteDetailsViewController");
}

-(void)viewWillAppear:(BOOL)animated{
    if(_note){
        os_log_info(_log, "view appear (details mode)");
        
        _titleTextField.text = _note.title;
        _bodyTextView.text = _note.body;
    }
    else{
        //TODO
        os_log_info(_log, "view appear (insert mode)");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [[NotesModel sharedInstance] addNoteWithTitle:_titleTextField.text body:_bodyTextView.text];
    os_log_info(_log, "new note saved");
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
