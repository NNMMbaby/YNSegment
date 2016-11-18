# YNSegment




 ![image](https://github.com/NNMMbaby/YNSegment/blob/master/hahaha.gif)


很简单的 分段选择器 单页面的

```
 NSArray *titles = @[@"全部训练",@"放松",@"减脂",@"塑性",@"增肌",@"拉伸",@"瘦身"];
    
    YNSegmentView *segView = [[YNSegmentView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50) titles:titles clickBlick:^(NSInteger index) {
        
        NSLog(@"%ld:%@",(long)index,titles[index - 1]);
        
        
        
    }];

    segView.backgroundColor = [UIColor blackColor];
    segView.segSelectColor = [UIColor whiteColor];
    segView.segNomalColor = [UIColor whiteColor];
    
    
    [self.view addSubview: segView];




```

