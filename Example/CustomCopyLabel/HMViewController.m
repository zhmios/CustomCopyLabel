//
//  HMViewController.m
//  CustomCopyLabel
//
//  Created by zhmios on 07/29/2019.
//  Copyright (c) 2019 zhmios. All rights reserved.
//

#import "HMViewController.h"
#import "CustomCopyLabel.h"

@interface HMViewController ()

@property (weak, nonatomic) IBOutlet CustomCopyLabel *testLabel;


@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.testLabel.canPaste = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
