//
//  UIColor_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory.h>

@interface NSString_Extension_Tests : XCTestCase

@end

@implementation NSString_Extension_Tests

- (void)testEmptyString {
    XCTAssert([[NSString srm_emptyString] isEqualToString:@""]);
}

- (void)test_isNilOrEmptyString {
    XCTAssert([NSString srm_isNilOrEmptyString:nil]);
    XCTAssert([NSString srm_isNilOrEmptyString:@""]);
    XCTAssert([NSString srm_isNilOrEmptyString:@" "]);
    XCTAssertFalse([NSString srm_isNilOrEmptyString:@"String"]);
}

- (void)test_md5HexDigest {
    XCTAssert([[@"test" srm_md5HexDigest] isEqualToString:@"098f6bcd4621d373cade4e832627b4f6"]);
}

@end
