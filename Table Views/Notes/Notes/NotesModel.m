//
//  NotesModel.m
//  Notes
//
//  Created by Matteo Vigoni on 26/03/2018.
//  Copyright © 2018 Odd Jobs. All rights reserved.
//

#import "NotesModel.h"

#import <os/log.h>

@implementation NotesModel
{
    NSMutableArray<Note *> *_notesArr;
    os_log_t _log;
}

+(NotesModel *) sharedInstance{
    static NotesModel *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NotesModel alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(instancetype) init{
    self = [super init];
    if(self){
        [self initNoteModel];
    }
    
    return self;
}

-(void)initNoteModel{
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
    
    _log = os_log_create("com.smartfab.notes", "NotesModel");
}

-(NSArray<Note *> *)notes{
    return [NSArray arrayWithArray:_notesArr];
}

-(void)addNoteWithTitle:(NSString *)title body:(NSString *)body{
    Note *newNote = [[Note alloc] initWithContext:_context];
    newNote.title = title;
    newNote.body = body;
    
    [_notesArr addObject:newNote];
    os_log_info(_log, "note added");
}

@end
