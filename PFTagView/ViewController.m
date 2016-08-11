//
//  ViewController.m
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "ViewController.h"
#import "PFTagViewList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @20, @"特朗普",
                          @13, @"希拉里",
                          @7, @"里约奥运会",
                          @3, @"今天有什么好玩的", nil];
    // By default
    PFTagViewList *sampleView1 = [[PFTagViewList alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)
                                                                 dict:dict
                                                               config:[PFTagViewConfiguration new]];
    [self.view addSubview:sampleView1];

    // Config whatever you like
    PFTagViewConfiguration *configuration = [PFTagViewConfiguration new];
    configuration.tagViewBackgroundColor = [UIColor blackColor];
    configuration.tagViewCountLabelTextColor = [UIColor yellowColor];
    configuration.tagViewMainTextColor = [UIColor whiteColor];
    configuration.tagViewCountLabelFontSize = 8.f;
    configuration.maxFontSize = 24.f;
    configuration.minFontSize = 10.f;
    configuration.tagViewHeight = 30.f;
    configuration.tagViewMargin = 10.f;
    PFTagViewList *sampleView2 = [[PFTagViewList alloc] initWithFrame:CGRectMake(0, 230, self.view.frame.size.width, 100)
                                                                 dict:dict
                                                               config:configuration];
    [self.view addSubview:sampleView2];
    
    // Let's scroll!
    PFTagViewList *sampleView3 = [[PFTagViewList alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 100)
                                                                 dict:dict
                                                               config:[PFTagViewConfiguration new]];
    sampleView3.layer.borderColor = [UIColor blackColor].CGColor;
    sampleView3.layer.borderWidth = 1.f;
    [self.view addSubview:sampleView3];
    
    // Scroll, with configuration!
    PFTagViewList *sampleView4 = [[PFTagViewList alloc] initWithFrame:CGRectMake(0, 600, self.view.frame.size.width, 30)
                                                                 dict:dict
                                                               config:configuration];
    [self.view addSubview:sampleView4];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
