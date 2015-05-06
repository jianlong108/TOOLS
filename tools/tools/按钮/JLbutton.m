//
//  JLbutton.m
//  网易彩票
//
//  Created by long108 on 15/3/3.
//  Copyright (c) 2015年 long108. All rights reserved.
//

#import "JLbutton.h"
#import "UIView+Frame.h"
@implementation JLbutton

# warning 当按钮被点击处于高亮状态时,系统会自动做一些复杂操作
/**
 *  取消按钮高亮状态下的复杂操作
 */
- (void)setHighlighted:(BOOL)highlighted
{
//    [super setHighlighted:highlighted];
}
/**
 *  图片在右,文字在左
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = self.imageView.x;
    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
}
/**
 *  图片在上,文字在下
 */
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.contentMode = UIViewContentModeCenter;
//    self.titleLabel.font = [UIFont systemFontOfSize:12];
//    
//    self.imageView.x = 0;
//    self.imageView.y = 0;
//    self.imageView.width = self.width*0.8;
//    self.imageView.height = self.height*0.7;
//    
//    self.titleLabel.x = 8;
//    self.titleLabel.y = self.imageView.height*0.8;
//    self.titleLabel.width = self.width;
//    self.titleLabel.height = self.height *0.5;
//    
//}

@end
