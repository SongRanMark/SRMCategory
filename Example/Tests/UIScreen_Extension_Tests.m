//
//  UIColor_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory.h>

@interface UIScreen_Extension_Tests : XCTestCase

@end

@implementation UIScreen_Extension_Tests

- (void)testScreenSize {
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    XCTAssert([UIScreen srm_mainWidth] == screenWidth);
    XCTAssert([UIScreen srm_mainHeight] == screenHeight);
    XCTAssert(CGSizeEqualToSize([UIScreen srm_mainSize], CGSizeMake(screenWidth, screenHeight)));
}

@end
