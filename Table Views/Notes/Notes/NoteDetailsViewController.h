//
//  NoteDetailsViewController.h
//  Notes
//
//  Created by Matteo Vigoni on 26/03/2018.
//  Copyright © 2018 Odd Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note+CoreDataClass.h"

@interface NoteDetailsViewController : UIViewController

@property (readwrite, nullable) Note *note;

@end
