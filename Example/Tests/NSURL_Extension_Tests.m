//
//  NSURL_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 08/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory.h>

static NSString *const kDomain = @"http://example.com";

@interface NSURL_Extension_Tests : XCTestCase

@end

@implementation NSURL_Extension_Tests

#pragma mark - URLByAppendingQueryItemWithName_value

- (void)test_URLByAppendingQueryItemWithName_value_noQueryItem {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItemWithName:@"key" value:@"value"];
    NSString *resultURLString = [kDomain stringByAppendingString:@"?key=value"];
    XCTAssert([resultURL.absoluteString isEqualToString:resultURLString]);
}

- (void)test_URLByAppendingQueryItemWithName_value_haveQueryItem {
    NSString *defaultURLString = [kDomain stringByAppendingString:@"?key1=value1"];
    NSURL *defaultURL = [NSURL URLWithString:defaultURLString];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItemWithName:@"key2" value:@"value2"];
    NSString *resultURLString = [defaultURLString stringByAppendingString:@"&key2=value2"];
    XCTAssert([resultURL.absoluteString isEqualToString:resultURLString]);
}

- (void)test_URLByAppendingQueryItemWithName_value_nilQueryItem {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItemWithName:nil value:nil];
    XCTAssert([resultURL.absoluteString isEqualToString:kDomain]);
}

- (void)test_URLByAppendingQueryItemWithName_value_emptyQueryItem {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItemWithName:@"" value:@""];
    XCTAssert([resultURL.absoluteString isEqualToString:kDomain]);
}

- (void)test_URLByAppendingQueryItemWithName_value_invalidQueryItem {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItemWithName:@"key" value:@""];
    XCTAssert([resultURL.absoluteString isEqualToString:kDomain]);
}

- (void)test_URLByAppendingQueryItemWithName_value_chineseQueryItem {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItemWithName:@"键" value:@"值"];
    NSString *unencodeURLString = [kDomain stringByAppendingString:@"?键=值"];
    NSCharacterSet *characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *resultURLString = [unencodeURLString stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    XCTAssert([resultURL.absoluteString isEqualToString:resultURLString]);
}

#pragma mark - URLByAppendingQueryItems

- (void)test_URLByAppendingQueryItems_normal {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSDictionary *queryItems = @{
                                 @"key" : @"value",
                                 @"键" : @"值"
                                 };
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItems:queryItems];
    NSString *unencodeURLString = [kDomain stringByAppendingString:@"?key=value&键=值"];
    NSCharacterSet *characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *resultURLString = [unencodeURLString stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    XCTAssert([resultURL.absoluteString isEqualToString:resultURLString]);
}

- (void)test_URLByAppendingQueryItems_nil {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItems:nil];
    XCTAssert([resultURL.absoluteString isEqualToString:kDomain]);
}

- (void)test_URLByAppendingQueryItems_empty {
    NSURL *defaultURL = [NSURL URLWithString:kDomain];
    NSDictionary *queryItems = @{
                                 @"" : @"",
                                 @"key" : @""
                                 };
    NSURL *resultURL = [defaultURL srm_URLByAppendingQueryItems:queryItems];
    XCTAssert([resultURL.absoluteString isEqualToString:kDomain]);
}

@end
