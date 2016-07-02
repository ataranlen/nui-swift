//
//  NUITableViewCellRendererTests.m
//  NUIDemo
//
//  Created by Alexey Trenikhin on 3/14/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIConstants.h"
#import "NUIFileMonitor.h"
#import "NUISettings.h"
#import "UIView+NUI.h"

#import "NUIDemo-Swift.h"

@interface NUITableViewCellRendererTests : XCTestCase
@property (strong, nonatomic) UITableViewCell *sut;
@end

@implementation NUITableViewCellRendererTests

- (void)setUp {
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    _sut = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    [_sut applyNUI];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testContentViewBackgroundColor {
    XCTAssertEqualObjects(self.sut.contentView.backgroundColor, [UIColor orangeColor], @"NUI should set content view background color");
}

- (void)testTintColor {
    XCTAssertEqual(_sut.tintColor, [UIColor greenColor] , @"NUI should set tintColor");
}


@end
