//
//  NotesTableViewController.m
//  Notes
//
//  Created by Matteo Vigoni on 26/03/2018.
//  Copyright © 2018 Odd Jobs. All rights reserved.
//

#import "NotesTableViewController.h"
#import "Note+CoreDataClass.h"
#import "AppDelegate.h"
#import "NoteDetailsViewController.h"
#import "NotesModel.h"

#import <os/log.h>

#define CELL_ID_NOTE @"com.smatrfab.note.reuseId"
#define SEGUE_NOTE_DETAILS @"showNoteDetailsPush"
#define SEGUE_NOTE_DETAILS_NEW @"showNoteDetailsModally"

@interface NotesTableViewController ()

@end

@implementation NotesTableViewController
{
    NSManagedObjectContext *_context;
    AppDelegate *_appDelegate;
    NSArray<Note*> *_notesArr;
    Note *_selectedNote;
    os_log_t _log;
}

- (void)viewDidLoad {
    os_log_debug(_log, "view will appear");
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    _context = _appDelegate.persistentContainer.viewContext;
    
    _notesArr = [NotesModel sharedInstance].notes;
    
    _log = os_log_create("com.smartfab.notes", "NotesTableViewController");
}

-(void)viewWillAppear:(BOOL)animated{
    os_log_debug(_log, "view will appear");
    _notesArr = [[NotesModel sharedInstance] notes];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_notesArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    os_log_info(_log, "cell selected %@", indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_NOTE];
    
    // Configure the cell...
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID_NOTE];
    }
    
    cell.textLabel.text = [_notesArr objectAtIndex:indexPath.row].title;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedNote = [_notesArr objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:SEGUE_NOTE_DETAILS sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_NOTE_DETAILS]){
        if([segue.destinationViewController isKindOfClass:[NoteDetailsViewController class]]){
            [segue.destinationViewController setNote:_selectedNote];
        }
    }
}

@end
