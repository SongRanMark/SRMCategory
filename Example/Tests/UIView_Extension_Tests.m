//
//  UIColor_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory-umbrella.h>

@interface UIView_Extension_Tests : XCTestCase

@end

@implementation UIView_Extension_Tests

- (void)test_clearSubviews {
    UIView *superView = [[UIView alloc] init];
    [superView addSubview:[[UIView alloc] init]];
    [superView addSubview:[[UIView alloc] init]];
    [superView addSubview:[[UIView alloc] init]];
    XCTAssert(superView.subviews.count == 3);
    [superView srm_clearSubviews];
    XCTAssert(superView.subviews.count == 0);
}

@end
