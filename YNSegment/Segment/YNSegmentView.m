//
//  YNSegmentView.m
//  YNSegment
//
//  Created by 李艳楠 on 16/11/18.
//  Copyright © 2016年 Jessica. All rights reserved.
//

#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define TextColor [UIColor redColor]
#define HorizontalSelectCount 5
#define TagNorm 1300

#import "YNSegmentView.h"

@interface YNSegmentView()

// 存储btn数组
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIButton *titleBtn;
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *selectLine;
@property (nonatomic, assign) CGFloat btnWidth;

@end


@implementation YNSegmentView

-(instancetype)initWithFrame:(CGRect)frame
                      titles:(NSArray *)titleArray
                  clickBlick:(btnClickBlock)block{
    
    self = [super initWithFrame:frame];
    
    
    if(self) {
        
        _btnWidth = 0.0;
        if (titleArray.count <= HorizontalSelectCount) {
            _btnWidth = ScreenWidth / titleArray.count;
        } else {
            _btnWidth = ScreenWidth / HorizontalSelectCount;
        }
        
        _titles = titleArray;
        _defaultIndex = 1;
        _textFont = [UIFont systemFontOfSize:15];
        _btns = [[NSMutableArray alloc]initWithCapacity:0];
        _segNomalColor = [UIColor blackColor];
        _segSelectColor = [UIColor redColor];
        
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.frame.size.height)];
        _bgScrollView.backgroundColor = [UIColor clearColor];
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.contentSize = CGSizeMake(_btnWidth * titleArray.count, self.frame.size.height);
        [self addSubview:_bgScrollView];
        
        _selectLine = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 2, _btnWidth, 2)];
        _selectLine.backgroundColor = _segSelectColor;
        [_bgScrollView addSubview:_selectLine];
        
        for (int i = 0; i < titleArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(_btnWidth * i, 0, _btnWidth, frame.size.height);
            btn.tag = TagNorm + i;
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:_segNomalColor forState:UIControlStateNormal];
            [btn setTitleColor:_segSelectColor forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [btn setBackgroundColor:[UIColor clearColor]];

            btn.titleLabel.font = _textFont;
            [_bgScrollView addSubview:btn];
            [_btns addObject:btn];
            
            if (i == 0) {
                _titleBtn = btn;
                btn.selected = YES;
            }
            self.block = block;
            
        }
        
    }
    
    return self;
}


-(void)btnClick:(UIButton *)sender{
    
    if (self.block) {
        self.block(sender.tag + 1 - TagNorm );
    }
    
    if (sender.tag == (_defaultIndex + TagNorm - 1)){
        return;
    } else {
     
        _titleBtn.selected = !_titleBtn.selected;
        _titleBtn = sender;
        _titleBtn.selected = YES;
        _defaultIndex = sender.tag + 1 - TagNorm;
        
    }
    
    // 计算偏移量
    CGFloat offsetX = sender.frame.origin.x - _btnWidth * 2;
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = _bgScrollView.contentSize.width - ScreenWidth;
    if (offsetX > maxOffsetX){
        offsetX = maxOffsetX;
    }
    
    [UIView animateWithDuration:.2 animations:^{
        
        [_bgScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        
        _selectLine.frame = CGRectMake(sender.frame.origin.x, self.frame.size.height - 2, sender.frame.size.width, 2);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)setSegNomalColor:(UIColor *)segNomalColor{
    _segNomalColor = segNomalColor;
    [self reloadView];
}

- (void)setSegSelectColor:(UIColor *)segSelectColor{
    _segSelectColor = segSelectColor;
    [self reloadView];
}

-(void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    [self reloadView];
}

-(void)setDefaultIndex:(NSInteger)defaultIndex{
    _defaultIndex = defaultIndex;
    [self reloadView];
}

- (void)reloadView{
    
    for (UIButton *btn in _btns) {
        [btn setTitleColor:_segNomalColor forState:UIControlStateNormal];
        [btn setTitleColor:_segSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = _textFont;
        _selectLine.backgroundColor = _segSelectColor;
        
        if (btn.tag == (_defaultIndex + TagNorm - 1)) {
            _titleBtn = btn;
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
        
    }
    
}

@end



