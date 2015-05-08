//
//  CycleImageCell.m
//  图片轮播器
//
//  Created by apple on 15-1-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CycleImageCell.h"

@interface CycleImageCell()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end
@implementation CycleImageCell

- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    
    self.imageView.image = [UIImage imageWithData:data];
}

@end
