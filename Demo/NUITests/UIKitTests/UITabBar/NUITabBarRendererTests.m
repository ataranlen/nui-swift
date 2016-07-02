//
//  NUITabBarRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 03/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIConstants.h"
#import "NUIFileMonitor.h"
#import "NUISettings.h"
#import "UIView+NUI.h"

#import "NUIDemo-Swift.h"
#import <UIImage_ColorFromImage/UIImage+ColorFromImage.h>

@interface NUITabBarRendererTests : XCTestCase
@property (strong, nonatomic) UITabBar *sut;
@end

@implementation NUITabBarRendererTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _sut.nuiClass = @"TabBar";
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

// background-color (Color)
- (void)testSetBackgroundColor
{
    UIColor *backgroundColor = _sut.backgroundColor;
    
    XCTAssertEqualObjects(backgroundColor, [UIColor redColor], @"NUI should set tab bar background color");
}

// background-tint-color (Color)
- (void)testSetBackgroundTintColor
{
    XCTAssertEqualObjects(_sut.tintColor, [UIColor yellowColor], @"NUI should set tab bar tint color");
}

// bar-tint-color (Color)
- (void)testSetBarTintColor
{
    XCTAssertEqualObjects(_sut.barTintColor, [UIColor blueColor], @"NUI should set tab bar bar-tint color");
}


// selected-image-tint-color (Color)
// Note: This property no longer gets set in iOS 7. This seems to be
// a known bug. http://stackoverflow.com/a/19307700/816002
//- (void)testSetSelectedImageTintColor
//{
//    XCTAssertEqualObjects(_sut.selectedImageTintColor, [UIColor orangeColor], @"NUI should set tab bar selected image tint color");
//}

@end
