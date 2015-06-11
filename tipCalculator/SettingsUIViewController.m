//
//  SettingsUIViewController.m
//  tipCalculator
//
//  Created by Kenny Lin on 6/10/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "SettingsUIViewController.h"

@interface SettingsUIViewController ()

@end

@implementation SettingsUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadDefaultSettings];
}

-(void) viewDidAppear:(BOOL)animated{
    [self loadDefaultSettings];
}

- (void) loadDefaultSettings {
    NSUserDefaults *myDefault=[NSUserDefaults standardUserDefaults];
    int tipIndex=(int)[myDefault integerForKey:@"defaultTipPercentIndex"];
    self.defaultTipPercent.selectedSegmentIndex=tipIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)updateDefaultTipPercent:(UISegmentedControl *)sender {
    NSLog(@"the default percent selected: %ld, %@",sender.selectedSegmentIndex,
          [self.defaultTipPercent titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:sender.selectedSegmentIndex forKey:@"defaultTipPercentIndex"];
    [defaults synchronize];
}

@end
