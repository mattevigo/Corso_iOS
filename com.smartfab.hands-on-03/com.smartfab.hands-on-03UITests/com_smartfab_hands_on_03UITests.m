//
//  com_smartfab_hands_on_03UITests.m
//  com.smartfab.hands-on-03UITests
//
//  Created by Gabriele on 12/03/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface com_smartfab_hands_on_03UITests : XCTestCase

@end

@implementation com_smartfab_hands_on_03UITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
