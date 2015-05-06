//
//  UIBarButtonItem+JLBarbutton.m
//  网易彩票
//
//  Created by long108 on 15/3/3.
//  Copyright (c) 2015年 long108. All rights reserved.
//

#import "UIBarButtonItem+JLBarbutton.h"

@implementation UIBarButtonItem (JLBarbutton)
+ (instancetype)barButtonItemWithNormalImage:(NSString *)name SelectedImage:(NSString *)Sname AndTittle:(NSString *)tittle AddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateHighlighted];
    btn.titleLabel.text = tittle;
//    btn.imageView.image = [UIImage imageNamed:name];
    [btn addTarget:target action:action forControlEvents:events];
    [btn sizeToFit];
   return  [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
