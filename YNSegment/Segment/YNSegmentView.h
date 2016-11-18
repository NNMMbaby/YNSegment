//
//  YNSegmentView.h
//  YNSegment
//
//  Created by 李艳楠 on 16/11/18.
//  Copyright © 2016年 Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnClickBlock)(NSInteger index);


@interface YNSegmentView : UIView


@property (nonatomic, strong)UIColor *segNomalColor;

@property (nonatomic, strong)UIColor *segSelectColor;

@property (nonatomic, strong)UIFont *textFont;

@property (nonatomic, assign)NSInteger defaultIndex;

@property (nonatomic, copy)btnClickBlock block;



-(instancetype)initWithFrame:(CGRect)frame
                      titles:(NSArray *)titleArray
                  clickBlick:(btnClickBlock)block;


@end
