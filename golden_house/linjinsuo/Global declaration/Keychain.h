//
//  Keychain.h
//  临沂
//
//  Created by Rathakrishnan on 2017/11/7.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#ifndef Keychain_h
#define Keychain_h

//国际化
#undef L
#define L(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

#define umengKey @"5ad948bda40fa36e360000b8"
#define kWeixinAppKey @"wxb5a4b69bb3ffba6c"
#define kWeixinAppSecret @"ae1f9dAppSecretafa0805d62e6a373b338771cc4"
#define kQQKey @"1106754553"
#define kWeiboKey @"5ad948bda40fa36e360000b8"
#define kWeiboAppSecret @"5ad948bda40fa36e360000b8"


#endif /* Keychain_h */
