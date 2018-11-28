//
//  ShowLocalImagesDemoVC.m
//  linjinsuo
//
//  Created by mac on 2018/11/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ShowLocalImagesDemoVC.h"
#import "XLImageViewer.h"
#import "ImageCell.h"
#import "SDImageCache.h"


@interface ShowLocalImagesDemoVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
}

@end

@implementation ShowLocalImagesDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"本地"];
    [self setBackLeftButton:@""];
    [self buildUI];
}


-(NSArray*)imagePathes
{
    return @[[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"4" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"5" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"6" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"7" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"8" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"9" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"10" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"11" ofType:@"png"],
             [[NSBundle mainBundle] pathForResource:@"12" ofType:@"png"]];
}

-(void)buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSInteger ColumnNumber = 3;
    CGFloat imageMargin = 10.0f;
    CGFloat itemWidth = (self.view.bounds.size.width - (ColumnNumber + 1)*imageMargin)/ColumnNumber;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    flowLayout.itemSize = CGSizeMake(itemWidth,itemWidth);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT - topHeight - SafeAreaBottomHeight) collectionViewLayout:flowLayout];
    _collectionView.showsHorizontalScrollIndicator = false;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"ImageCell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

#pragma mark -
#pragma mark CollectionViewDelegate&DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self imagePathes].count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"ImageCell";
    ImageCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.layer.borderWidth = 1.0f;
    cell.imagePath = [self imagePathes][indexPath.row];
    return  cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //利用XLImageViewer显示本地图片
    [[XLImageViewer shareInstanse] showLocalImages:[self imagePathes] index:indexPath.row fromImageContainer:[collectionView cellForItemAtIndexPath:indexPath]];
}


@end
