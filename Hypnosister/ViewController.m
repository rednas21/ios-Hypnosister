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
    
    HypnosisView *anotherHypnosisView = [[HypnosisView alloc] initWithFrame:CGRectMake(frame.origin.x+frame.size.width, 0, frame.size.width, frame.size.height)];
    [self.scrollView addSubview:anotherHypnosisView];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*2, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
