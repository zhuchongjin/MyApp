//
//  OrdersDropdownSelection.h
//  CooperChimney
//
//  Created by Karthik Baskaran on 29/09/16.
//  Copyright © 2016 Karthik Baskaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define NormalAnimation(_inView,_duration,_option,_frames)            [UIView transitionWithView:_inView duration:_duration options:_option animations:^{ _frames    }

@class SSPopup;

typedef void (^VSActionBlock)(int);
@protocol SSPopupDelegate <NSObject>

@optional

-(void)GetSelectedOutlet:(int)tag;

@end

@interface SSPopup : UIControl<UITableViewDataSource,UITableViewDelegate>
{
    
    VSActionBlock completionBlock;
    UITableView *DropdownTable;
    NSString *Title;
    
}
@property (nonatomic, assign) id<SSPopupDelegate> SSPopupDelegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<SSPopupDelegate>)delegate;

-(void)CreateTableview

:(NSArray *)Contentarray withSender:(id)sender setCompletionBlock:(VSActionBlock )aCompletionBlock;

@end
