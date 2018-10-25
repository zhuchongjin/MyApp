//
//  OrdersDropdownSelection.m
//  CooperChimney
//
//  Created by zcj on 29/09/17.
//  Copyright © 2017 zcj. All rights reserved.
//

#import "SSPopup.h"

@interface SSPopup ()
{
    AppDelegate *appDelegate;
    
    NSArray *ordersarray;
    
    UIButton *ParentBtn;
}
@end

@implementation SSPopup

- (id)initWithFrame:(CGRect)frame delegate:(id<SSPopupDelegate>)delegate
{
    self = [super init];
    if ((self = [super initWithFrame:frame]))
    {
        self.SSPopupDelegate = delegate;
    }
    
    return self;
}


-(void)CreateTableview:(NSArray *)Contentarray withSender:(id)sender setCompletionBlock:(VSActionBlock )aCompletionBlock{
    
    [self addTarget:self action:@selector(CloseAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    self.alpha = 0;
    self.backgroundColor = [UIColor colorWithWhite:0.00 alpha:0.5];
    completionBlock = aCompletionBlock;
    ParentBtn = (UIButton *)sender;
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    DropdownTable = [[UITableView alloc]initWithFrame:CGRectMake(self.frame.size.width/2 - (self.frame.size.width/1.2)/2,self.frame.size.height/2 - (self.frame.size.height/3)/2,self.frame.size.width/1.2,self.frame.size.height/3)];
    DropdownTable.backgroundColor = [UIColor whiteColor];
    DropdownTable.dataSource = self;
    DropdownTable.showsVerticalScrollIndicator = NO;
    DropdownTable.delegate = self;
    DropdownTable.layer.cornerRadius = 5.0f;
    DropdownTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:DropdownTable];
    
    
    ordersarray = [[NSArray alloc]initWithArray:Contentarray];
    
    
    NormalAnimation(self.superview, 0.30f,UIViewAnimationOptionTransitionNone,self.alpha=1;) completion:nil];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height/4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [ordersarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{

    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *Contentlbl = [[UILabel alloc]initWithFrame:CGRectMake(10,0,tableView.frame.size.width-20,tableView.frame.size.height/4)];
    Contentlbl.backgroundColor = [UIColor clearColor];
    Contentlbl.text = [ordersarray objectAtIndex:indexPath.row];
    Contentlbl.textColor = [UIColor blackColor];
    Contentlbl.textAlignment = NSTextAlignmentCenter;
    Contentlbl.font = [UIFont systemFontOfSize:12];
    [cell.contentView addSubview:Contentlbl];
    
    
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(0, Contentlbl.frame.origin.y+Contentlbl.frame.size.height-2,self.frame.size.width, .5)];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [Contentlbl addSubview:lineView];
    
    if(indexPath.row == [ordersarray count] -1){
        
        lineView.hidden=YES;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor = LHColor(248, 218, 218);
    
    
    [ParentBtn setTitle:[ordersarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    
    if (completionBlock) {
        
        completionBlock((int)indexPath.row);
    }
    
    if ([self.SSPopupDelegate respondsToSelector:@selector(GetSelectedOutlet:)]) {
        
        [self.SSPopupDelegate GetSelectedOutlet:(int)indexPath.row];
    }
    
    
    [self CloseAnimation];
    
    
}

-(void)CloseAnimation{
    
    NormalAnimation(self.superview, 0.30f,UIViewAnimationOptionTransitionNone,DropdownTable.alpha=0;)completion:^(BOOL finished){
    
    [DropdownTable removeFromSuperview];
    [self removeFromSuperview];
    
    }];
}

@end
