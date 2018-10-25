//
//  ShareManager.h
//  jinyingmeileNative
//
//  Created by Rathakrishnan on 17/03/2017.
//  Copyright © 2017 Jinyingmeile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareManager : NSObject

+ (instancetype)sharedManager;

- (void)shareWithSharedType:(NSInteger)shareType
                      title:(NSString *)title
                      image:(NSString *)image
                        url:(NSString *)url
                    content:(NSString *)content
                 controller:(UIViewController *)controller;


@end
