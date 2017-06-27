//
//  SRMViewController.m
//  SRMCategory
//
//  Created by githubsr on 06/26/2017.
//  Copyright (c) 2017 githubsr. All rights reserved.
//

#import "SRMViewController.h"
#import <SRMCategory/SRMCategory-umbrella.h>

NSString *const kSuperViewIdentifier = @"kSuperViewIdentifier";
NSString *const kCenterViewIdentifier = @"kCenterViewIdentifier";
NSString *const kCenterConstantViewIdentifier = @"kCenterConstantViewIdentifier";
NSString *const kSizeViewIdentifier = @"kSizeViewIdentifier";
NSString *const kEqualSizeViewIdentifier = @"kEqualSizeViewIdentifier";
NSString *const kEqualEdgeViewIdentifier = @"kEqualEdgeViewIdentifier";
NSString *const kEdgeConstantViewIdentifier = @"kEdgeConstantViewIdentifier";
NSString *const kSubviewIdentifier = @"kSubviewIdentifier";
NSString *const kNextToXViewIdentifier = @"kNextToXViewIdentifier";
NSString *const kNextToYViewIdentifier = @"kNextToYViewIdentifier";
const CGFloat kCenterViewConstantX = 10;
const CGFloat kCenterViewConstantY = 10;
const CGFloat kViewWidth = 50;
const CGFloat kViewHeight = 50;
const CGFloat kEdgeInsetTop = 5;
const CGFloat kEdgeInsetBottom = 5;
const CGFloat kEdgeInsetLeading = 5;
const CGFloat kEdgeInsetTrailing = 5;

@interface SRMViewController ()

@end

@implementation SRMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.accessibilityIdentifier = kSuperViewIdentifier;
    [self addCenterView];
    [self addCenterConstantView];
    [self addSizeView];
    [self addEqualSizeView];
    [self addEqualEdgeView];
    [self addEdgeConstantView];
    [self addNextToView];
}

- (void)addCenterView {
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.accessibilityIdentifier = kCenterViewIdentifier;
    [view srm_addSizeConstraints:CGSizeMake(kViewWidth, kViewHeight)];
    [view srm_addCenterConstraintsEqualToView:self.view];
}

- (void)addCenterConstantView {
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.accessibilityIdentifier = kCenterConstantViewIdentifier;
    [view srm_addSizeConstraints:CGSizeMake(kViewWidth, kViewHeight)];
    [view srm_addCenterConstraintsToView:self.view offset:UIOffsetMake(kCenterViewConstantX, kCenterViewConstantY)];
}

- (void)addSizeView {
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.accessibilityIdentifier = kSizeViewIdentifier;
    [view srm_addSizeConstraints:CGSizeMake(kViewWidth, kViewHeight)];
    [view srm_addCenterConstraintsEqualToView:self.view];
}

- (void)addEqualSizeView {
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.accessibilityIdentifier = kEqualSizeViewIdentifier;
    [view srm_addSizeConstraintsEqualToView:self.view];
    [view srm_addCenterConstraintsEqualToView:self.view];
}

- (void)addEqualEdgeView {
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.accessibilityIdentifier = kEqualEdgeViewIdentifier;
    [view srm_addEdgesConstraintsEqualToView:self.view];
}

- (void)addEdgeConstantView {
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.accessibilityIdentifier = kEdgeConstantViewIdentifier;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(kEdgeInsetTop, kEdgeInsetLeading, kEdgeInsetBottom, kEdgeInsetTrailing);
    [view srm_addEdgesConstraintsToView:self.view insets:edgeInsets];
}

- (void)addNextToView {
    UIView *subview = [[UIView alloc] init];
    [self.view addSubview:subview];
    subview.accessibilityIdentifier = kSubviewIdentifier;
    [subview srm_addSizeConstraints:CGSizeMake(kViewWidth, kViewHeight)];
    [subview srm_addCenterConstraintsEqualToView:self.view];
    UIView *nextToXView = [[UIView alloc] init];
    [self.view addSubview:nextToXView];
    nextToXView.accessibilityIdentifier = kNextToXViewIdentifier;
    [nextToXView srm_addSizeConstraints:CGSizeMake(kViewWidth, kViewHeight)];
    [nextToXView srm_addCenterConstraintEqualToViewVertically:subview];
    [nextToXView srm_addConstraintNextToViewHorizontally:subview];
    UIView *nextToYView = [[UIView alloc] init];
    [self.view addSubview:nextToYView];
    nextToYView.accessibilityIdentifier = kNextToYViewIdentifier;
    [nextToYView srm_addSizeConstraints:CGSizeMake(kViewWidth, kViewHeight)];
    [nextToYView srm_addCenterConstraintEqualToViewHorizontally:subview];
    [nextToYView srm_addConstraintNextToViewVertically:subview];
}

@end
