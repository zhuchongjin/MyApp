//
//  XLImageVC.m
//  linjinsuo
//
//  Created by mac on 2018/11/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "XLImageVC.h"
#import "ShowNetImagesDemoVC.h"
#import "ShowLocalImagesDemoVC.h"
#import "XLImageLoading.h"

@interface XLImageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation XLImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"仿今日头条图片浏览工具，支持下滑返回"];
    [self setBackLeftButton:@""];
    [self.view addSubview:self.tableView];
    
}

#pragma mark -
#pragma mark 配置信息
-(NSArray*)cellTitles
{
    return @[@"Show network images",@"Show local images",@"1、查看网络、本地图片查看；支持长图显示、双击和拖拽实现放大和缩小功能。2、支持单击、下滑返回。"];
}

-(NSArray*)vcClasses
{
    return @[[ShowNetImagesDemoVC class],[ShowLocalImagesDemoVC class]];
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 100;
    }
    
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self cellTitles].count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self cellTitles][indexPath.row];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 2) {
        [XLImageLoading showAlertInView:self.view message:@"图片存储成功,"];
    }else{
        
        Class vcClass = [self vcClasses][indexPath.row];
        UIViewController *vc = [[vcClass alloc] init];
        [self pushVc:vc];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottomHeight-topHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //        if (@available(iOS 11.0, *)) {
        //            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //        } else {
        //            // Fallback on earlier versions
        //        }
        

        _tableView.backgroundColor = LHBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
        if (DeviceSystemVersion.doubleValue >= 11.0) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
        [self.tableView setSeparatorColor:LHBackgroundColor];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 85+SafeAreaBottomHeight, 0);
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(topHeight, 0, 85+SafeAreaBottomHeight, 0);
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
