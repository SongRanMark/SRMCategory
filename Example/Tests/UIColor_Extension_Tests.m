//
//  UIColor_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory-umbrella.h>

@interface UIColor_Extension_Tests : XCTestCase

@end

@implementation UIColor_Extension_Tests

#pragma mark - colorWithHex

- (void)test_colorWithHex_normal {
    UIColor *color = [UIColor srm_colorWithHex:0xcccccc];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 204 / 255.0f);
    XCTAssert(green == 204 / 255.0f);
    XCTAssert(blue == 204 / 255.0f);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithHex_lessThanMinimum {
    UIColor *color = [UIColor srm_colorWithHex:-1];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 0);
    XCTAssert(green == 0);
    XCTAssert(blue == 0);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithHex_moreThanMaximum {
    UIColor *color = [UIColor srm_colorWithHex:0xff000000];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 1);
    XCTAssert(green == 1);
    XCTAssert(blue == 1);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithHex_lessThan6Bit {
    UIColor *color = [UIColor srm_colorWithHex:0xfff];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 0);
    XCTAssert(green == 15 / 255.0f);
    XCTAssert(blue == 1);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithHex_alpha_normal {
    CGFloat alphaValue = 0.5;
    UIColor *color = [UIColor srm_colorWithHex:0x000000 alpha:alphaValue];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 0);
    XCTAssert(green == 0);
    XCTAssert(blue == 0);
    XCTAssert(alpha == alphaValue);
}

- (void)test_colorWithHex_alpha_lessThanMinimum {
    UIColor *color = [UIColor srm_colorWithHex:0x000000 alpha:-1];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 0);
    XCTAssert(green == 0);
    XCTAssert(blue == 0);
    XCTAssert(alpha == 0);
}

- (void)test_colorWithHex_alpha_moreThanMaximum {
    UIColor *color = [UIColor srm_colorWithHex:0x000000 alpha:2];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 0);
    XCTAssert(green == 0);
    XCTAssert(blue == 0);
    XCTAssert(alpha == 1);
}

#pragma mark - colorWithRGB

- (void)test_colorWithRGB_normal {
    UIColor *color = [UIColor srm_colorWithR:204 G:204 B:204];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 204 / 255.0f);
    XCTAssert(green == 204 / 255.0f);
    XCTAssert(blue == 204 / 255.0f);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithRGB_lessThanMinimum {
    UIColor *color = [UIColor srm_colorWithR:-1 G:-1 B:-1];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 0);
    XCTAssert(green == 0);
    XCTAssert(blue == 0);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithRGB_moreThanMaximum {
    UIColor *color = [UIColor srm_colorWithR:256 G:256 B:256];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 1);
    XCTAssert(green == 1);
    XCTAssert(blue == 1);
    XCTAssert(alpha == 1);
}

- (void)test_colorWithRGB_alpha_normal {
    CGFloat alphaValue = 0.5;
    UIColor *color = [UIColor srm_colorWithR:204 G:204 B:204 A:alphaValue];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 204 / 255.0f);
    XCTAssert(green == 204 / 255.0f);
    XCTAssert(blue == 204 / 255.0f);
    XCTAssert(alpha == alphaValue);
}

- (void)test_colorWithRGB_alpha_lessThanMinimum {
    UIColor *color = [UIColor srm_colorWithR:204 G:204 B:204 A:-1];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 204 / 255.0f);
    XCTAssert(green == 204 / 255.0f);
    XCTAssert(blue == 204 / 255.0f);
    XCTAssert(alpha == 0);
}

- (void)test_colorWithRGB_alpha_moreThanMaximum {
    UIColor *color = [UIColor srm_colorWithR:204 G:204 B:204 A:2];
    CGFloat red, green, blue, alpha;
    BOOL compatible = [color getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssert(compatible);
    XCTAssert(red == 204 / 255.0f);
    XCTAssert(green == 204 / 255.0f);
    XCTAssert(blue == 204 / 255.0f);
    XCTAssert(alpha == 1);
}

@end
