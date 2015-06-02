//
//  ViewController.m
//  Hypnosister
//
//  Created by Sander Peerna on 6/2/15.
//  Copyright (c) 2015 Sander Peerna. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.frame = self.view.frame;

    CGRect frame = self.scrollView.frame;
    HypnosisView *hypnosisView = [[HypnosisView alloc] initWithFrame:frame];
    [self.scrollView addSubview:hypnosisView];
    
    //    CGRect secondFrame = CGRectMake(40, 120, 50, 50);
    //    HypnosisView *secondView = [[HypnosisView alloc] initWithFrame: secondFrame];
    //    secondView.backgroundColor = [UIColor blueColor];
    //    [firstView addSubview: secondView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
