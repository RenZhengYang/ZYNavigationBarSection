
//  ViewController.m
//  ZYNavigationBarSection
/**
 //  简书：http://www.jianshu.com/p/50c928abfef4
 - (IBAction)clickOtherSectionViewController:(id)sender {
 ZYSegmentViewController *segmentVc = [[ZYSegmentViewController alloc]init];
 
 ********************************用法************************************************
segmentVc.titleBtnArr = @[@"语文",@"数学",@"英语"];
oneTableViewController *tab1 = [[oneTableViewController alloc]init];
twoTableViewController *tab2 = [[twoTableViewController alloc]init];
threeTableViewController *tab3= [[threeTableViewController alloc]init];
segmentVc.vcArr = @[tab1,tab2,tab3];
********************************用法************************************************

 [self.navigationController pushViewController:segmentVc animated:YES];
 }
 */

#import "ViewController.h"
#import "ZYSegmentViewController.h"

#import "oneTableViewController.h"
#import "twoTableViewController.h"
#import "threeTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
}
- (IBAction)clickOtherSectionViewController:(id)sender {
 
    ZYSegmentViewController *segmentVc = [[ZYSegmentViewController alloc]init];
     /********************************用法************************************************/
        segmentVc.titleBtnArr = @[@"栏目",@"热播",@"主播"];
        segmentVc.bgColorSegView = [UIColor lightGrayColor];
        segmentVc.titleColorSegView = [UIColor redColor];
        segmentVc.selectColorSegView = [UIColor redColor];
        segmentVc.titleFontSegView =  [UIFont systemFontOfSize:14.0 weight:5];
        segmentVc.lineColorSegView = [UIColor blueColor];
    
        oneTableViewController *tab1 = [[oneTableViewController alloc]init];
        twoTableViewController *tab2 = [[twoTableViewController alloc]init];
        threeTableViewController *tab3= [[threeTableViewController alloc]init];
         segmentVc.vcArr = @[tab1,tab2,tab3];
    /********************************用法************************************************/
    [self.navigationController pushViewController:segmentVc animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{    //  显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
@end
