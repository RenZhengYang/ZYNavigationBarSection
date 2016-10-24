//
//  ZYSegmentViewController.h
//  ZYNavigationBarSection
//
//  Created by mac on 16/10/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "segmentView.h"
@interface ZYSegmentViewController : UIViewController



//================= 设置标题数组和子控制器 ===============
//   标题数组
@property(strong,nonatomic) NSArray *titleBtnArr;
//   要移动的标题子控制器
@property(strong,nonatomic)NSArray<UIViewController *>* vcArr;

//================= 设置标题数组和子控制器 ================



//================= 设置分段样式 ========================
//   背景颜色
@property(strong,nonatomic)UIColor * bgColorSegView;
//   标题颜色
@property(strong,nonatomic)UIColor * titleColorSegView;
//   选中标题颜色
@property(strong,nonatomic)UIColor * selectColorSegView;
//   标题大小
@property(strong,nonatomic)UIFont  *titleFontSegView;
//   下滑线颜色
@property(strong,nonatomic)UIColor * lineColorSegView;

//================= 设置分段样式 ========================
@end
