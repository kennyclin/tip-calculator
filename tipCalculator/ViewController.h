//
//  ViewController.h
//  tipCalculator
//
//  Created by Kenny Lin on 6/10/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;
- (IBAction)updateTipPercent:(UISegmentedControl *)sender;
- (IBAction)updateBillAmount:(UITextField *)sender;

-(void) displayTotalAmount:(float) amount;
-(void) displayTipAmount:(float) amount;
-(float) getBillAmount;
-(float) calculateTipPercentageForSegment:(int) segment;
-(float) calculateTipAmount: (float) amount percent:(float) percent;
-(void) updateDisplayedTip;
-(void) updateDisplayedTotal;


@end

