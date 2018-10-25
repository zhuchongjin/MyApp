//
//  ChangeFontWithButton.m
//  金鹰美乐
//
//  Created by Rathakrishnan on 30/12/2016.
//  Copyright © 2016 Jinyingmeile. All rights reserved.
//

#import "ChangeFontWithButton.h"

@implementation ChangeFontWithButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setCusFont:(UIFont *)cusFont{
    if (cusFont) {
        self.titleLabel.font=[cusFont fontWithSize:cusFont.pointSize*titleRatio];
        //        NSLogLeng(@"传进来Button的大小:%f 最终字体的大小:%f",cusFont.pointSize,self.titleLabel.font.pointSize);
    }
}
@end
