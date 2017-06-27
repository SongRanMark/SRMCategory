//
//  NSUserDefaults_Extension_Tests.m
//  Category Demo
//
//  Created by marksong on 06/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SRMCategory/SRMCategory-umbrella.h>

@interface NSUserDefaults_Extension_Tests : XCTestCase

@end

@implementation NSUserDefaults_Extension_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_nonNullStringForKey_normal {
    NSString *key = @"test_nonNullStringForKey_normal_key";
    NSString *value = @"test_nonNullStringForKey_normal_value";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
    NSString *result = [userDefaults srm_nonNullStringForKey:key];
    XCTAssert([result isEqualToString:value]);
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

- (void)test_nonNullStringForKey_nilValue {
    NSString *key = @"test_nonNullStringForKey_nilValue_key";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
    NSString *result = [userDefaults srm_nonNullStringForKey:key];
    XCTAssert([result isEqualToString:@""]);
}

- (void)test_nonNullStringForKey_nonStringClassValue {
    NSString *key = @"test_nonNullStringForKey_nonStringClassValue_key";
    NSDictionary *value = [NSDictionary dictionary];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
    NSString *result = [userDefaults srm_nonNullStringForKey:key];
    XCTAssert([result isEqualToString:@""]);
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

- (void)test_nonNullStringForKey_numberValue {
    NSString *key = @"test_nonNullStringForKey_numberValue_key";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@1 forKey:key];
    [userDefaults synchronize];
    NSString *result = [userDefaults srm_nonNullStringForKey:key];
    XCTAssert([result isEqualToString:@"1"]);
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

@end
