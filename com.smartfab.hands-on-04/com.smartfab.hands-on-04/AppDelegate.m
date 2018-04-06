//
//  AppDelegate.m
//  com.smartfab.hands-on-04
//
//  Created by Gabriele on 13/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
     *
     * Array
     *
     */
    // This
    NSArray<NSDate*>* a = [NSArray arrayWithObjects:[NSDate date], [NSDate date], [NSDate date], nil];
    // is same as this
    NSArray<NSDate*>* b = @[ [NSDate date], [NSDate date], [NSDate date] ];
    
    // For loop where index is irrelevant
    for(NSDate* d in a) {
        [d dateByAddingTimeInterval:10];
    }
    // For loop where index is needed
    for(int i = 0; i < b.count; i++) {
        [b[i] dateByAddingTimeInterval:10];
    }
    
    // Git first and last element of array
    NSDate* firstEl = a.firstObject;
    NSDate* lastEl = a.lastObject;
    
    // Mutable array
    NSMutableArray* mutableArr = [NSMutableArray array];
    NSDate* elementToAdd = [NSDate date];
    // Add a single object
    [mutableArr addObject:elementToAdd];
    // Add multiple objects
    [mutableArr addObjectsFromArray:a];
    // Insert object at first index
    [mutableArr insertObject:elementToAdd atIndex:0];
    
    // Get mutable version of immutable array
    NSMutableArray* mutableArr2 = [a mutableCopy];
    // is equal to
    NSMutableArray* mutableArr3 = [NSMutableArray arrayWithArray:a];
    
    // Wrapper for non object (aka primitive data)
    NSNumber* intWrapper = [NSNumber numberWithInt:2];
    NSNumber* floatWrapper = [NSNumber numberWithFloat:3.0f];
    // Is equivalent to
    NSNumber* floatWrapper2 = @(3.0f);
    
    // Array with "primitive" values
    NSArray<NSNumber*>* primitiveArray = @[
                                           [NSNumber numberWithInt:1],
                                           [NSNumber numberWithInt:2],
                                           [NSNumber numberWithInt:3],
                                           [NSNumber numberWithInt:4]
                                           ];
    // Is equivalent to
    NSArray<NSNumber*>* primitiveArray2 = @[
                                            @(1),
                                            @(2),
                                            @(3),
                                            @(4),
                                            ];
    
    // Try to map array
    NSMutableArray<NSNumber*>* finalArray = [NSMutableArray array];
    NSArray<NSNumber*>* sourceArray = @[ @(1), @(2), @(3), @(4) ];
    for(NSNumber* n in sourceArray)
        [finalArray addObject:@([n intValue] * 2)];
    // Print
    for(NSNumber* n in finalArray)
        NSLog(@"%@ - %d", n, [n intValue]);
    
    /*
     *
     * Dizionari
     *
     */
    // Empty dict
    NSDictionary* d = [NSDictionary dictionary];
    
    // Dict initialised with fixed content
    NSDictionary* d2 = @{
                         @"Gabriele": @(28),
                         @"Fabrizio": @(30),
                         @"Riccard": @(25)
                         };
    
    // Dict with specific key and value types
    NSDictionary<NSString*, NSNumber*>* d3 = @{
                         @"Gabriele": @(28),
                         @"Fabrizio": @(30),
                         @"Riccardo": @(25)
                         };
    
    for(NSString* k in d3.allKeys)
        NSLog(@"Il voto di %@ e' %@", k, d3[k]);
    
    // Mutable version
    NSMutableDictionary* mutableDict = [NSMutableDictionary dictionaryWithDictionary:d3];
    // Is equivalent to
    NSMutableDictionary* mutableDict2 = [d3 mutableCopy];
    
    // "Multi-column" dictionary
    NSMutableDictionary<NSString*, NSArray*>* multiColArray =
  @{
    @"k1": @[ @"Gabriele", [NSDate date]],
    @"k2": @[ @"Fabrizio", [NSDate date]],
    };
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
