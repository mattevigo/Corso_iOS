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

#define CELL_ID_NOTE @"com.smatrfab.note.reuseId"

@interface NotesTableViewController ()

@end

@implementation NotesTableViewController
{
    NSManagedObjectContext *_context;
    AppDelegate *_appDelegate;
    NSMutableArray<Note*> *_notesArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    _context = _appDelegate.persistentContainer.viewContext;
    
    _notesArr = [[NSMutableArray alloc] init];
    
    // Test core data
    Note *n = [[Note alloc] initWithContext:_context];
    n.title = @"Test";
    n.body = @"Body Test";
    [_notesArr addObject:n];
    
    assert(n != nil && n.body != nil);
    
    n = [[Note alloc] initWithContext:_context];
    n.title = @"Test 2";
    n.body = @"Body Test 2";
    [_notesArr addObject:n];
    
    assert(n != nil && n.body != nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_notesArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
