//
//  JMWebViewProress.h
//  FrameWorkPractice
//
//  Created by Chausson on 16/7/20.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMWebViewProgressDelegate;

@interface JMWebViewProress : NSObject<UIWebViewDelegate>

@property (nonatomic, readonly) NSProgress *currentProgress; // 0.0...1.0

@property (nonatomic, weak) id<JMWebViewProgressDelegate> progressDelegate;

@property (nonatomic, weak) id<UIWebViewDelegate> webViewProxyDelegate;

@end

@protocol JMWebViewProgressDelegate <NSObject>

@optional

- (void)updateProgress:(NSProgress *)progress webViewProgress:(JMWebViewProress *)webViewProgress;

@end
