//
//  AssetsTableViewDataSource.m
//  linjinsuo
//
//  Created by mac on 2018/11/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AssetsTableViewDataSource.h"

@implementation AssetsTableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MeViewCellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MeViewCellId];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MeViewCellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.contentMode = UITableViewCellAccessoryNone;
        
    }
    cell.textLabel.text = self.titles[indexPath.row];
    cell.imageView.transform = CGAffineTransformMakeScale(.6, .6);
    cell.imageView.image = LHIconImageInfoMake(self.images[indexPath.row], 35, LHRandomColor);
    //    cell.separatorInset = UIEdgeInsetsMake(0.3f, 40.0f, 0.0f,0.0f);
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 9.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}


@end
