//
//  CycleViewController.m
//  图片轮播器
//
//  Created by apple on 15-1-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CycleViewController.h"
#import "CycleImageCell.h"

@interface CycleViewController()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

/** 当前页面索引 */
@property (nonatomic, assign) NSUInteger currentIndex;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CycleViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 设置界面布局
    self.layout.itemSize = self.view.bounds.size;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
    // 当前页面索引 = 0
    self.currentIndex = 0;
    // 滚动到第一张图片
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    // 开启时钟
    [self startTimer];
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageURLs.count;
}

- (NSUInteger)indexWithOffset:(NSUInteger)offset {
    return (self.currentIndex + offset - 1 + self.imageURLs.count) % self.imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CycleImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageURL = self.imageURLs[[self indexWithOffset:indexPath.item]];
    NSLog(@"%@ %tu", cell.imageURL.lastPathComponent, indexPath.item);
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.currentIndex = [self indexWithOffset:offset];
    
    // 滚动到第一张图片
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    [UIView setAnimationsEnabled:NO];
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    [UIView setAnimationsEnabled:YES];
    
    NSLog(@"重设位置");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}

#pragma mark - 时钟方法
- (void)startTimer {
    if (self.timer) {
        return;
    }
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(fire) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/** 时钟触发方法 */
- (void)fire {
    // 取出当前显示cell
    NSIndexPath *indexPath = [self.collectionView indexPathsForVisibleItems].lastObject;
    
    NSLog(@"%@", indexPath);
    
    // 显示下一张
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:(indexPath.item + 1) inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self scrollViewDidEndDecelerating:self.collectionView];
    });
}

- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

@end
