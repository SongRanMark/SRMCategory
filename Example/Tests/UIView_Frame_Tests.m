//
//  UIColor_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory-umbrella.h>

@interface UIView_Frame_Tests : XCTestCase

@end

@implementation UIView_Frame_Tests

- (void)test {
    CGFloat originX = 5, originY = 10, width = 50, height = 100;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    XCTAssert(view.originX == originX);
    XCTAssert(view.originY == originY);
    XCTAssert(CGPointEqualToPoint(view.origin, CGPointMake(originX, originY)));
    XCTAssert(view.width == width);
    XCTAssert(view.height == height);
    XCTAssert(CGSizeEqualToSize(view.size, CGSizeMake(width, height)));
    CGFloat newOriginX = 10, newOriginY = 5, newWidth = 100, newHeight = 50;
    view.originX = newOriginX;
    view.originY = newOriginY;
    view.width = newWidth;
    view.height = newHeight;
    XCTAssert(view.originX == newOriginX);
    XCTAssert(view.originY == newOriginY);
    XCTAssert(CGPointEqualToPoint(view.origin, CGPointMake(newOriginX, newOriginY)));
    XCTAssert(view.width == newWidth);
    XCTAssert(view.height == newHeight);
    XCTAssert(CGSizeEqualToSize(view.size, CGSizeMake(newWidth, newHeight)));
}

@end
