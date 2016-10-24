//
//  segmentView.m
//  ZYNavigationBarSection
//
//  Created by mac on 16/10/21.
//  Copyright © 2016年 mac. All rights reserved.
//
#define zy_BtnTag 0  //  不知道为什莫是0，界面才会流畅

#import "segmentView.h"
@interface segmentView() <RZYSegmentViewDelegate>
@property(strong,nonatomic)UIColor *segmentBgColor;

@end

@implementation segmentView{
    UIView                        * _underlineView;
    NSMutableArray         *_btnArr;
    NSInteger                   _selectTag;
    
    CGFloat                       _rzy_width;      //  标题宽度
}


- (instancetype)initWithFrame:(CGRect)frame
{
      _selectTag = 0;
       self = [super initWithFrame:frame];
      _btnArr =  [NSMutableArray arrayWithCapacity:_btnArr.count];
     return self;

}

- (void)addButtonToSegumentView:(NSArray *)SegumentBtnTitleArray
                                         BgColor :(UIColor *)BgColor
                                            titleColor:(UIColor *)titleColor
                                        selectColor:(UIColor *)selectColor
                                            titleFont:(UIFont *)titleFont
                                            lineColor:(UIColor *)lineColor;
{
    self.backgroundColor = BgColor;
    CGFloat zy_width =  (self.bounds.size.width) / SegumentBtnTitleArray.count;
    _rzy_width = zy_width;
    for (NSInteger i = 0; i < SegumentBtnTitleArray.count; i++) {
        //  添加按钮
        UIButton *btn = [[UIButton alloc]initWithFrame:(CGRect){zy_width *i,0,zy_width,self.bounds.size.height - 2}];
        [self addSubview:(
                          [btn setTitle:SegumentBtnTitleArray[i] forState:UIControlStateNormal],
                          [btn.titleLabel setFont:titleFont],
                          [btn setTitleColor:titleColor forState:UIControlStateNormal],
                          [btn setTitleColor:selectColor forState:UIControlStateSelected],
                            [btn setTag:(i + zy_BtnTag)],
                          [btn addTarget:self action:@selector(clickBtnJumpPage:) forControlEvents:UIControlEventTouchUpInside],
                          btn
         )];
     
     //  添加下滑线
        if (i == 0) {
            _underlineView = [[UIView alloc]initWithFrame:(CGRect){i*zy_width, self.bounds.size.height-2, zy_width, 2}];
        [self addSubview:(
                                    _underlineView.backgroundColor = lineColor,
                                    _underlineView
         )];
            
              }
        [_btnArr addObject:btn];
 }
       [[_btnArr firstObject] setSelected:YES];
}

/**
 *传入点击频道tag值，进行选中状态的调整以及下划线走向的调整
 */
- (void)clickBtnAdjustTheSlideLineState:(NSInteger)currentTag
{
    if (_selectTag != currentTag) {
        [_btnArr[_selectTag]  setSelected:NO];
        [_btnArr[currentTag] setSelected:YES];
        [UIView animateWithDuration:0.1 animations:^{
            [_underlineView setFrame:CGRectMake((currentTag - zy_BtnTag) *_rzy_width, self.bounds.size.height-2, _rzy_width, 2)];
        }];
        
        _selectTag  = currentTag;
        
        if ([self.zy_delegate respondsToSelector:@selector(segmentViewClickBtnTag:)]) {
            [self.zy_delegate segmentViewClickBtnTag:(_selectTag )];
        }
}
    }

- (void)clickBtnJumpPage:(UIButton *)btn
{
    [self clickBtnAdjustTheSlideLineState:btn.tag];
}

@end
