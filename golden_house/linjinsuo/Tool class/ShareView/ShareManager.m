//
//  ShareManager.m
//  jinyingmeileNative
//
//  Created by Rathakrishnan on 17/03/2017.
//  Copyright © 2017 Jinyingmeile. All rights reserved.
//

#import "ShareManager.h"

static ShareManager *_singleton = nil;

@implementation ShareManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] init];
    });
    return _singleton;
}
- (void)shareWithSharedType:(NSInteger)shareType
                      title:(NSString *)title
                      image:(NSString *)image
                        url:(NSString *)url
                    content:(NSString *)content
                 controller:(UIViewController *)controller {
    
    UMSocialPlatformType type ;

    switch (shareType) {
        case 1:
        {
           type = UMSocialPlatformType_WechatSession;
            break;
        }
        case 2:
        {
            type = UMSocialPlatformType_WechatTimeLine;
            break;
        }
        case 3:
        {
            type = UMSocialPlatformType_Sina;
            break;
        }
        case 4:
        {
            type = UMSocialPlatformType_QQ;
            break;
        }
        case 5:
        {
            type = UMSocialPlatformType_Qzone;
            break;
        }
       
        default:
            break;
    }
    @try
    {
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
//    //创建网页内容对象
//    NSString* thumbURL =  image;
        UMShareWebpageObject *shareObject;
    if (IsStrEmpty(title)) {
         shareObject = [UMShareWebpageObject shareObjectWithTitle:@"来自临沂APP的分享" descr:content thumImage:[UIImage imageNamed:@"app_icon"]];
    }else
    {
         shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:content thumImage:[UIImage imageNamed:@"app_icon"]];
    }
   
    //设置网页地址
    shareObject.webpageUrl = url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;

        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:type messageObject:messageObject currentViewController:controller completion:^(id data, NSError *error) {
            
            NSLog(@"come here check");
        }];
    }
     @catch(id anException)
    {
        
    }
}
@end
