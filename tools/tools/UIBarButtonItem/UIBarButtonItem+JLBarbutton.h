//
//  UIBarButtonItem+JLBarbutton.h
//  网易彩票
//
//  Created by long108 on 15/3/3.
//  Copyright (c) 2015年 long108. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JLBarbutton)
+ (instancetype)barButtonItemWithNormalImage:(NSString *)name SelectedImage:(NSString *)Sname AndTittle:(NSString *)tittle AddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events;
@end
