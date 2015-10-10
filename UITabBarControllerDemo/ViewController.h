//
//  ViewController.h
//  UITabBarControllerDemo
//
//  Created by 王鹏 on 10/10/15.
//  Copyright © 2015 dianping.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

@interface UITabBarItem (TSTabBar)

- (void)setImage:(UIImage *)image withHighLightedImage:(UIImage *)highLightedImage;
@end