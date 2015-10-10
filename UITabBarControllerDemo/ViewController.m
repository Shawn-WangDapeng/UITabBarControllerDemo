//
//  ViewController.m
//  UITabBarControllerDemo
//
//  Created by 王鹏 on 10/10/15.
//  Copyright © 2015 dianping.com. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


@interface ViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UITabBar *tabBar;
@property (nonatomic, strong) NSArray *controllersArray;
@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        _tabBarController = [[UITabBarController alloc] init];
        [self addChildViewController:_tabBarController];
        _tabBarController.delegate = self;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self initControllers];
    _tabBarController.view.frame = self.view.bounds;
    _tabBarController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tabBarController.view.backgroundColor = [UIColor purpleColor];
    _tabBarController.tabBar.barStyle = UIBarStyleDefault;
//    tabBar添加各个controllers
    _tabBarController.viewControllers = self.controllersArray;
//    设置点击后字体变化的颜色
    _tabBarController.tabBar.tintColor = [UIColor orangeColor];
    _tabBarController.selectedIndex = 1;
    [self.view addSubview:_tabBarController.view];
}

- (void)initControllers {
    NSMutableArray *mutableArr = [[NSMutableArray alloc] init];
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.view.backgroundColor = [UIColor greenColor];
    firstVC.title = @"First";
//    右上角的小红点内容
    firstVC.tabBarItem.badgeValue = @"新消息";
    [mutableArr addObject:firstVC];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor redColor];
    secondVC.title = @"Second";
    [mutableArr addObject:secondVC];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.view.backgroundColor = [UIColor yellowColor];
    thirdVC.title = @"third";
    [mutableArr addObject:thirdVC];
    FourthViewController *fouthVC = [[FourthViewController alloc] init];
    fouthVC.view.backgroundColor = [UIColor blueColor];
    fouthVC.title = @"fouth";
    [mutableArr addObject:fouthVC];
    self.controllersArray = mutableArr;
    
}

- (void)setItemImage:(UIImage *)normalImage withHighlightedImage:(UIImage *)highLightedImage withTitle:(NSString *)title atIndex:(NSInteger)index {
//    增强健壮性
    if (index < 0 || index >= self.controllersArray.count) {
        return;
    }
    UIViewController *vc = (UIViewController *)self.controllersArray[index];
    vc.tabBarItem = [[UITabBarItem alloc] init];
    vc.tabBarItem.title = title;
    [vc.tabBarItem setImage:normalImage withHighLightedImage:highLightedImage];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setItemImage:[UIImage imageNamed:@"home_footbar_icon_dianping"] withHighlightedImage:[UIImage imageNamed:@"home_footbar_icon_dianping_pressed"] withTitle:@"第一个" atIndex:0];
    [self setItemImage:[UIImage imageNamed:@"home_footbar_icon_dianping"] withHighlightedImage:[UIImage imageNamed:@"home_footbar_icon_dianping_pressed"] withTitle:@"第二个" atIndex:1];
    [self setItemImage:[UIImage imageNamed:@"home_footbar_icon_dianping"] withHighlightedImage:[UIImage imageNamed:@"home_footbar_icon_dianping_pressed"] withTitle:@"第三个" atIndex:2];
    [self setItemImage:[UIImage imageNamed:@"home_footbar_icon_dianping"] withHighlightedImage:[UIImage imageNamed:@"home_footbar_icon_dianping_pressed"] withTitle:@"第四个" atIndex:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITabBar *)tabBar {
    return self.tabBarController.tabBar;
}
@end

@implementation UITabBarItem (TSTabBar)

- (void)setImage:(UIImage *)image withHighLightedImage:(UIImage *)highLightedImage {
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setSelectedImage:[highLightedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
}

@end
