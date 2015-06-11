//
//  SettingsUIViewController.h
//  tipCalculator
//
//  Created by Kenny Lin on 6/10/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsUIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipPercent;
- (IBAction)updateDefaultTipPercent:(UISegmentedControl *)sender;

@end
