//
//  MVVMViewController.m
//  linjinsuo
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "MVVMView.h"


static NSString *const reuserId = @"reuserId";
@interface MVVMViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray    *dataArray;
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) MVVMViewModel     *vm;


@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleName:@"MVVM"];
    [self setRightImage:@"刷新" image:@""];
    
    
    UIView *view = [UIView viewWithFrame:CGRectMake(0, topHeight, 200, 200) backgroundColor:LHRedColor borderColor:nil cornerRadius:0];
    [self.view addSubview:view];
    
//    [self.view addSubview:self.tableView];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    
//    __weak typeof(self) weakSelf = self;
//    self.vm = [[MVVMViewModel alloc] init];
//    [self.vm initWithBlock:^(id data) {
//        NSArray *array = data;
//        [weakSelf.dataArray removeAllObjects];
//        [weakSelf.dataArray addObjectsFromArray:array];
//        MVVMView *headView = [[MVVMView alloc] initWithFrame:CGRectMake(0,topHeight, SCREEN_WIDTH, (array.count + 1)/4*50)];
//        [headView headViewWithData:array];
//        weakSelf.tableView.tableHeaderView = headView;
//        [weakSelf.tableView reloadData];
//        
//    } fail:nil];
    
}

- (void)RightTextClick:(UIButton *)sender
{
    NSLog(@"1212121212212")
}

#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 标记
    self.vm.contentKey = self.dataArray[indexPath.row];
    
}


#pragma mark - lazy

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuserId];
    }
    return _tableView;
}

@end
