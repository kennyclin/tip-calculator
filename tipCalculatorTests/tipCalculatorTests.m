//
//  tipCalculatorTests.m
//  tipCalculatorTests
//
//  Created by Kenny Lin on 6/10/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface tipCalculatorTests : XCTestCase
@property (strong, nonatomic) ViewController *vc;

@end

@implementation tipCalculatorTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName: @"Main" bundle:nil];
    self.vc=[storyBoard instantiateViewControllerWithIdentifier: @"tipCalculatorViewController"];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone: YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testThatVCInstantiates {
    XCTAssertNotNil(self.vc);
}

-(void)testDisplayTotalAmountForZero {
    [self.vc displayTotalAmount:0];
    NSString *result=self.vc.totalAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
}

-(void)testDisplayTotalAmountForFloat {
    [self.vc displayTotalAmount:123.56];
    NSString *result=self.vc.totalAmount.text;
    XCTAssertEqualObjects(result, @"$123.56");
}

-(void)testCalculateTipPercentForSegment0{
    float percent=[self.vc calculateTipPercentageForSegment:0];
    XCTAssertEqualWithAccuracy(percent, 0.1, 0.001, @"Expected percent %f should be 0.1", percent);
}

-(void)testCalculateTipPercentForSegment2{
    float percent=[self.vc calculateTipPercentageForSegment:2];
    XCTAssertEqualWithAccuracy(percent, 0.20, 0.001, @"Expected percent %f should be 0.2", percent);
}

-(void) testGetBillAmountWhenBlank {
    self.vc.billAmount.text=@"";
    float result=[self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 0.00, 0.001);
}

-(void) testGetBillAmountWhen12point34 {
    self.vc.billAmount.text=@"12.34";
    float result=[self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}

-(void) testGetBillAmountWhen12point34pint56 {
    self.vc.billAmount.text=@"12.34.56";
    float result=[self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}

-(void) testCalculateTipAmount {
    float tip=[self.vc calculateTipAmount:12.34 percent:0.10];
    XCTAssertEqualWithAccuracy(tip, 1.23, 0.05);
}

-(void) testUpdateDisplayTipForZero {
    self.vc.billAmount.text=@"0";
    self.vc.tipPercent.selectedSegmentIndex=0;
    [self.vc updateDisplayedTip];
    //    NSString *tipString=self.vc.tipAmount.text;
    XCTAssertEqualObjects(self.vc.tipAmount.text, @"$0.00");
}

-(void) testUpdateDisplayTipFor10by10 {
    self.vc.billAmount.text=@"10.00";
    self.vc.tipPercent.selectedSegmentIndex=0;
    [self.vc updateDisplayedTip];
    XCTAssertEqualObjects(self.vc.tipAmount.text, @"$1.00");
}

-(void) testUpdateDisplayTotalForZero {
    self.vc.billAmount.text=@"0";
    self.vc.tipPercent.selectedSegmentIndex=0;
    [self.vc updateDisplayedTotal];
    XCTAssertEqualObjects(self.vc.totalAmount.text, @"$0.00");
}

-(void) testUpdateDisplayTotalFor10by10 {
    self.vc.billAmount.text=@"10.00";
    self.vc.tipPercent.selectedSegmentIndex=0;
    [self.vc updateDisplayedTotal];
    XCTAssertEqualObjects(self.vc.totalAmount.text, @"$11.00");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}



@end
