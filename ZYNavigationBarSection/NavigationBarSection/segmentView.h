//
//  segmentView.h
//  ZYNavigationBarSection
//
//  Created by mac on 16/10/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RZYSegmentViewDelegate <NSObject>

@optional
//  把按钮的tag，传到外界做事情
- (void)segmentViewClickBtnTag:(NSInteger)selectedBtnTag;

@end


@interface segmentView : UIView
/**遵守协议对象*/
@property(weak,nonatomic)id <RZYSegmentViewDelegate> zy_delegate;
/*
 * 选中按钮的tag
 */
- (void)clickBtnAdjustTheSlideLineState:(NSInteger)currentTag;

/**
 *  设置分段view
 *  @param SegumentBtnTitleArray 标题数组
 *  @param BgColor        背景颜色
 *  @param titleColor       标题颜色
 *  @param selectColor   选中标题颜色
 *  @param titleFont         标题大小
 *  @param lineColor       下滑线颜色
 */
- (void)addButtonToSegumentView:(NSArray *)SegumentBtnTitleArray
                       BgColor :(UIColor *)BgColor
                     titleColor:(UIColor *)titleColor
                    selectColor:(UIColor *)selectColor
                      titleFont:(UIFont *)titleFont
                      lineColor:(UIColor *)lineColor;
@end
