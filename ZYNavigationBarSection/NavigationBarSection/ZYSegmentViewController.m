//
//  ZYSegmentViewController.m
//  ZYNavigationBarSection
//
//  Created by mac on 16/10/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#define K_ZY_SCREEM_WIDTH   CGRectGetWidth([UIScreen mainScreen].bounds)
#define K_ZY_SCREEM_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#import "ZYSegmentViewController.h"
@interface ZYSegmentViewController ()<RZYSegmentViewDelegate,UIScrollViewDelegate>

@end

@implementation ZYSegmentViewController
{
   UIScrollView          *_mainScrollView;
    segmentView        *_segmentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.  设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    //  2. 设置导航栏
    [self setCustomNav];
    //  3. 设置背景颜色以及自适应
    self.automaticallyAdjustsScrollViewInsets = NO;
    //  4.  将控制器的数组传入
    [self createMainScrollView:_vcArr];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //  显示导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)setCustomNav{
    
    //  背景View
    UIView *backView = [[UIView alloc]initWithFrame:(CGRect){0,0,K_ZY_SCREEM_WIDTH,64}];
     [self.view addSubview:(
      backView.backgroundColor = [UIColor lightGrayColor],
      backView
      )];
    //  返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backView addSubview:(
                                                    backBtn.frame = (CGRect){0,20,40,40},
                                                    [backBtn setImage:[UIImage imageNamed:@"返回Btn"] forState:UIControlStateNormal],
                                                    [backBtn addTarget:self action:@selector(OnTapBackBtn:) forControlEvents:UIControlEventTouchUpInside],
                                                    backBtn
     )];
    
    _segmentView = [[segmentView alloc]initWithFrame:(CGRect){0,0,K_ZY_SCREEM_WIDTH / 2,34}];
    CGFloat centerX = backView.center.x;
    [backView addSubview:(
                                                     _segmentView.center = CGPointMake(centerX, 40),
                                                    _segmentView.zy_delegate = self,
                                                    _segmentView
     )];
    /**
     此处是设置导航栏的样式
     */
    [_segmentView addButtonToSegumentView:  _titleBtnArr
                                                             BgColor:_bgColorSegView
                                                            titleColor:_titleColorSegView
                                                        selectColor:_selectColorSegView
                                                             titleFont:_titleFontSegView
                                                            lineColor:_lineColorSegView];
}
- (void)createMainScrollView:(NSArray<UIViewController *>*) vcArr {
    CGFloat begainScrollViewY = 64;
    _mainScrollView = [[UIScrollView alloc]initWithFrame:(CGRect){0, begainScrollViewY, K_ZY_SCREEM_WIDTH,(K_ZY_SCREEM_HEIGHT - begainScrollViewY)}];
    
   [self.view addSubview:(
                           _mainScrollView.backgroundColor = [UIColor cyanColor],
                           _mainScrollView.bounces = NO,
                           _mainScrollView.pagingEnabled = YES,
                            _mainScrollView.delegate = self,
                           _mainScrollView.contentSize = CGSizeMake(K_ZY_SCREEM_WIDTH * _titleBtnArr.count, 0),
                           _mainScrollView
     )];

    #warning  添加滚动显示的三个对应的界面view
    for (NSInteger i = 0; i < _titleBtnArr.count; i++) {
        vcArr[i].view.frame = (CGRect){K_ZY_SCREEM_WIDTH *i, 0, K_ZY_SCREEM_WIDTH,K_ZY_SCREEM_HEIGHT};
           [_mainScrollView addSubview:vcArr[i].view];
        vcArr[i].view.backgroundColor = RandomColor;
    }

}




#pragma mark --- UIScrollView代理方法
static NSInteger pageNumber = 0;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageNumber = (int)(scrollView.contentOffset.x / K_ZY_SCREEM_WIDTH + 0.5);
    //    滑动SV里视图,切换标题
    [_segmentView clickBtnAdjustTheSlideLineState:pageNumber];
    
}

#pragma mark ---RZYSegmentViewDelegate
- (void)segmentViewClickBtnTag:(NSInteger)selectedBtnTag
{
        //        加入动画,显得不太过于生硬切换
    [UIView animateWithDuration:.2 animations:^{
    _mainScrollView.contentOffset = CGPointMake(K_ZY_SCREEM_WIDTH *selectedBtnTag, 0);
    }];
}
#pragma mark - 点击返回按钮
- (void)OnTapBackBtn:(UIButton *)Btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
