//
//  NotesModel.h
//  Notes
//
//  Created by Matteo Vigoni on 26/03/2018.
//  Copyright © 2018 Odd Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note+CoreDataClass.h"

@interface NotesModel : NSObject

+(NotesModel *) sharedInstance;

@property (readonly) NSArray<Note*> *notes;

@property (readwrite) NSManagedObjectContext *context;

-(void) addNoteWithTitle:(NSString *)title body:(NSString *)body;

@end
