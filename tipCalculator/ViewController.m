//
//  ViewController.m
//  tipCalculator
//
//  Created by Kenny Lin on 6/10/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayTheKeyboard];
    [self loadDefaultSettings];
}

-(void) viewDidAppear:(BOOL)animated {
     NSLog(@"view did appear");
    [self loadDefaultSettings];
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
}

-(void) viewWillDisappear:(BOOL)animated {
    NSUserDefaults *myDefault=[NSUserDefaults standardUserDefaults];
    [myDefault setObject:self.billAmount.text forKey: @"lastBillAmount"];
}

-(void) loadDefaultSettings{
    NSUserDefaults *myDefault=[NSUserDefaults standardUserDefaults];
    int tipIndex=(int)[myDefault integerForKey:@"defaultTipPercentIndex"];
    NSString *lastBillAmount=[myDefault objectForKey:@"lastBillAmount"];
    NSLog(@"default tip index: %d", tipIndex);
    self.tipPercent.selectedSegmentIndex=tipIndex;
    self.billAmount.text=lastBillAmount;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayTheKeyboard {
    [self.billAmount becomeFirstResponder];
}

-(void) dismissTheKeyboard {
    [self.billAmount resignFirstResponder];
}


- (IBAction)updateTipPercent:(UISegmentedControl *)sender {
    NSLog(@"tip percent changed: %ld, %@", (long) sender.selectedSegmentIndex,
          [self.tipPercent titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self dismissTheKeyboard];
}

- (IBAction)updateBillAmount:(UITextField *)sender {
    if (self.tipPercent.selectedSegmentIndex>=0){
        [self updateDisplayedTip];
        [self updateDisplayedTotal];
    }
}

-(NSString *) formatCurrency:(float)amount {
    NSNumberFormatter *nf=[[NSNumberFormatter alloc] init];
    nf.numberStyle=NSNumberFormatterCurrencyStyle;
    NSNumber *inputNum=[NSNumber numberWithFloat:amount];
    return [nf stringFromNumber:inputNum];
}
-(void) displayTipAmount:(float)amount {
    self.tipAmount.text=[self formatCurrency:amount];
}
-(void) displayTotalAmount:(float)amount {
    // doing the number formating
    self.totalAmount.text=[self formatCurrency:amount];
}
-(float) getBillAmount {
    return [self.billAmount.text floatValue];
}
-(float) calculateTipPercentageForSegment:(int) segment {
    NSString *tipText=[self.tipPercent titleForSegmentAtIndex:segment];
    return [tipText floatValue]/100.0;
}

-(float) calculateTipAmount:(float)amount percent:(float)percent {
    return amount*percent;
}

-(void) updateDisplayedTip {
    float amount=[self getBillAmount];
    int segment=(int) self.tipPercent.selectedSegmentIndex;
    float tipPercent=[self calculateTipPercentageForSegment: segment];
    float tipAmount=[self calculateTipAmount:amount percent:tipPercent];
    self.tipAmount.text=[self formatCurrency:tipAmount];
}

-(void) updateDisplayedTotal {
    float amount=[self getBillAmount];
    int segment=(int) self.tipPercent.selectedSegmentIndex;
    float tipPercent=[self calculateTipPercentageForSegment: segment];
    float tipAmount=[self calculateTipAmount:amount percent:tipPercent];
    float totalAmount=amount+tipAmount;
    self.totalAmount.text=[self formatCurrency:totalAmount];
}

@end
