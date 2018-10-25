//
//  GuidPageControlView.h
//  金鹰美乐
//
//  Created by Rathakrishnan on 30/12/2016.
//  Copyright © 2016 Jinyingmeile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuidPageControlView;

@protocol GuidPageControlViewDelegate <NSObject>
@optional
-(void)pageControlView:(GuidPageControlView *)pageControlView indexNum:(NSInteger)indexNum;
@end


@interface GuidPageControlView : UIView
/**
 *  滑动到的下标
 */
@property (nonatomic,assign)NSInteger  indexNumWithSlide;
/**
 *  代理属性
 */
@property (nonatomic,weak)id<GuidPageControlViewDelegate> delegate;
/**
 *  创建自定义的PageControl
 *
 *  @param frame                  frame(宽度一定要大于图片的所有宽度之和,高度大于等于图片的高度,不然会出现你想不到的恶心UI后果)
 *  @param pageNum                显示的个数(如果是4张就是4)
 *  @param currentPageIndex       当前显示的下标(0是第一个,所以其值<=(pageNum-1))
 *  @param currentShowImage       当前显示的图片
 *  @param pageIndicatorShowImage 接下来显示的图片
 *
 *  @return 自定义PageControl对象
 */
-(instancetype)initWithCusPageControl:(CGRect)frame pageNum:(NSInteger)pageNum currentPageIndex:(NSInteger)currentPageIndex currentShowImage:(UIImage *)currentShowImage pageIndicatorShowImage:(UIImage *)pageIndicatorShowImage;

#pragma mark 和上面的方法一样,这个是类方法
+(instancetype)guidPageControlView:(CGRect)frame pageNum:(NSInteger)pageNum currentPageIndex:(NSInteger)currentPageIndex currentShowImage:(UIImage *)currentShowImage pageIndicatorShowImage:(UIImage *)pageIndicatorShowImage;


@end
