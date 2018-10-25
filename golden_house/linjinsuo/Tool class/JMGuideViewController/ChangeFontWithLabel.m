//
//  ChangeFontWithLabel.m
//  金鹰美乐
//
//  Created by Rathakrishnan on 30/12/2016.
//  Copyright © 2016 Jinyingmeile. All rights reserved.
//

#import "ChangeFontWithLabel.h"

@implementation ChangeFontWithLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setCusFont:(UIFont *)cusFont{
    if (cusFont) {
        self.font=[cusFont fontWithSize:cusFont.pointSize*titleRatio];
        //        NSLogLeng(@"传进来Label的大小:%f 最终字体的大小:%f",cusFont.pointSize,self.font.pointSize);
    }
}
@end
