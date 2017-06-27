//
//  SRMCategory_ExampleUITests.m
//  SRMCategory_ExampleUITests
//
//  Created by marksong on 27/06/2017.
//  Copyright © 2017 githubsr. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SRMViewController.h"

@interface UIView_Constraint_Tests : XCTestCase

@end

@implementation UIView_Constraint_Tests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCenter {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *superElement = application.otherElements[kSuperViewIdentifier];
    XCUIElement *element = application.otherElements[kCenterViewIdentifier];
    XCTAssert(superElement.exists);
    XCTAssert(element.exists);
    CGPoint superCenter = CGPointMake(CGRectGetWidth(superElement.frame) / 2, CGRectGetHeight(superElement.frame) / 2);
    CGPoint elementCenter = CGPointMake(CGRectGetMidX(element.frame), CGRectGetMidY(element.frame));
    XCTAssert(CGPointEqualToPoint(superCenter, elementCenter));
}

- (void)testCenterConstant {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *superElement = application.otherElements[kSuperViewIdentifier];
    XCUIElement *element = application.otherElements[kCenterConstantViewIdentifier];
    XCTAssert(superElement.exists);
    XCTAssert(element.exists);
    CGPoint superCenter = CGPointMake(CGRectGetWidth(superElement.frame) / 2, CGRectGetHeight(superElement.frame) / 2);
    CGPoint elementCenter = CGPointMake(CGRectGetMidX(element.frame) - kCenterViewConstantX, CGRectGetMidY(element.frame) - kCenterViewConstantY);
    XCTAssert(CGPointEqualToPoint(superCenter, elementCenter));
}

- (void)testSize {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *element = application.otherElements[kSizeViewIdentifier];
    XCTAssert(element.exists);
    XCTAssert(CGSizeEqualToSize(element.frame.size, CGSizeMake(kViewWidth, kViewHeight)));
}

- (void)testEqualSize {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *superElement = application.otherElements[kSuperViewIdentifier];
    XCUIElement *element = application.otherElements[kEqualSizeViewIdentifier];
    XCTAssert(superElement.exists);
    XCTAssert(element.exists);
    XCTAssert(CGSizeEqualToSize(superElement.frame.size, element.frame.size));
}

- (void)testEqualEdge {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *superElement = application.otherElements[kSuperViewIdentifier];
    XCUIElement *element = application.otherElements[kEqualEdgeViewIdentifier];
    XCTAssert(superElement.exists);
    XCTAssert(element.exists);
    XCTAssert(CGSizeEqualToSize(superElement.frame.size, element.frame.size));
    CGPoint superCenter = CGPointMake(CGRectGetWidth(superElement.frame) / 2, CGRectGetHeight(superElement.frame) / 2);
    CGPoint elementCenter = CGPointMake(CGRectGetMidX(element.frame), CGRectGetMidY(element.frame));
    XCTAssert(CGPointEqualToPoint(superCenter, elementCenter));
}

- (void)testEdgeConstant {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *superElement = application.otherElements[kSuperViewIdentifier];
    XCUIElement *element = application.otherElements[kEdgeConstantViewIdentifier];
    XCTAssert(superElement.exists);
    XCTAssert(element.exists);
    CGSize size = CGSizeMake(CGRectGetWidth(element.frame) + kEdgeInsetLeading + kEdgeInsetTrailing, CGRectGetHeight(element.frame) + kEdgeInsetTop +
                             kEdgeInsetBottom);
    NSLog(@"%@", NSStringFromCGRect(element.frame));
    XCTAssert(CGSizeEqualToSize(superElement.frame.size, size));
    XCTAssert(CGPointEqualToPoint(element.frame.origin, CGPointMake(kEdgeInsetLeading, kEdgeInsetTop)));
}

- (void)testNextTo {
    XCUIApplication *application = [[XCUIApplication alloc] init];
    XCUIElement *standardElement = application.otherElements[kSubviewIdentifier];
    XCUIElement *nextToXElement = application.otherElements[kNextToXViewIdentifier];
    XCUIElement *nextToYElement = application.otherElements[kNextToYViewIdentifier];
    XCTAssert(standardElement.exists);
    XCTAssert(nextToXElement.exists);
    XCTAssert(nextToYElement.exists);
    XCTAssert(CGRectGetMidY(standardElement.frame) == CGRectGetMidY(nextToXElement.frame));
    XCTAssert(CGRectGetMaxX(standardElement.frame) == CGRectGetMinX(nextToXElement.frame));
    XCTAssert(CGRectGetMidX(standardElement.frame) == CGRectGetMidX(nextToYElement.frame));
    XCTAssert(CGRectGetMaxY(standardElement.frame) == CGRectGetMinY(nextToYElement.frame));
}

@end
