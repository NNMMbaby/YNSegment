//
//  ViewController.m
//  YNSegment
//
//  Created by 李艳楠 on 16/11/18.
//  Copyright © 2016年 Jessica. All rights reserved.
//

#import "ViewController.h"
#import "YNSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *titles = @[@"全部训练",@"放松",@"减脂",@"塑性",@"增肌",@"拉伸",@"瘦身"];
    
    YNSegmentView *segView = [[YNSegmentView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50) titles:titles clickBlick:^(NSInteger index) {
        
        NSLog(@"%ld:%@",(long)index,titles[index - 1]);
        
        
        
    }];

    segView.backgroundColor = [UIColor blackColor];
    segView.segSelectColor = [UIColor whiteColor];
    segView.segNomalColor = [UIColor whiteColor];
    
    
    [self.view addSubview: segView];



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
