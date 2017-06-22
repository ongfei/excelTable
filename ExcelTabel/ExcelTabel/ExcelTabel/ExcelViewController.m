//
//  ExcelViewController.m
//
//
//  Created by df on 2017/6/20.
//  Copyright © 2017年 Dyf. All rights reserved.
//

#import "ExcelViewController.h"

#import "SubtypeView.h"

#import "ClassifyView.h"

#import "ExcelCell.h"

#import "ExcelLeftView.h"

#import "Constant.h"

@interface ExcelViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rightTableV;

@property (nonatomic, strong) ExcelLeftView *leftView;

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) NSMutableArray *topArr;

@property (nonatomic, strong) NSArray *leftArr;

@property (nonatomic, strong) NSMutableArray *sourceArray;

@end

@implementation ExcelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
//    列数组
    self.topArr = [NSMutableArray array];
    
//    模拟数据
    self.sourceArray = [NSMutableArray array];
    
    for (int i = 0; i < leftCellNumber; i++) {
        
        [self.topArr addObject:[NSString stringWithFormat:@"第%d列",i]];
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:columnNumber];
        
        for (int j = 0; j < columnNumber; j++) {
            
            [arr addObject:[NSString stringWithFormat:@"第%d行,第%d列",i,j]];
            
        }
        
        [self.sourceArray addObject:arr];
        
    }
    
    
       [self prepareLayout];
}

- (void)prepareLayout {
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    左上角
    ClassifyView *classifyView = [[ClassifyView alloc] initWithFrame:CGRectMake(0, 64, leftWidth, mHeight)];
    
    classifyView.backgroundColor = [UIColor whiteColor];
    
    classifyView.layer.borderColor = [UIColor blackColor].CGColor;
    classifyView.layer.borderWidth = 1;
    
    [self.view addSubview:classifyView];
    
//    头部
    UIView *Headview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mWidth * columnNumber , mHeight)];
    
    self.headView = Headview;
    
    self.headView.backgroundColor = [UIColor blackColor];
    
    for(int i = 0; i < columnNumber; i++){
        
        SubtypeView *headView=[[SubtypeView alloc]initWithFrame:CGRectMake(i * (mWidth + 0.5), 0, mWidth - 0.5, mHeight - 1)];
        
        headView.backgroundColor = [UIColor whiteColor];
        
        headView.text = self.topArr[i];
        
//        headView.textLabel.text = self.topArr[i];
        
        [self.headView addSubview:headView];
    }

//   左部
    self.leftView = [[ExcelLeftView alloc] initWithFrame:CGRectMake(0, mHeight + 64, leftWidth, ScreenHeight - 64 - mHeight)];
    
    self.leftView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.leftView];
    
//    右部
    self.rightTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mWidth * columnNumber, ScreenHeight - 64) style:(UITableViewStylePlain)];
    
    self.rightTableV.delegate = self;
    
    self.rightTableV.dataSource = self;
    
    self.rightTableV.allowsSelection = NO;
    
    self.rightTableV.bounces = NO;

    self.rightTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.rightTableV registerClass:[ExcelCell class] forCellReuseIdentifier:@"ExcelCell"];
    
    
    UIScrollView *myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(leftWidth, 64, ScreenWidth - leftWidth, ScreenHeight)];
    
    [myScrollView addSubview: self.rightTableV];
    
//    myScrollView.bounces=NO;
    myScrollView.contentSize=CGSizeMake(mWidth * columnNumber, 0);
    
    [self.view addSubview:myScrollView];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return leftCellNumber;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return mHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ExcelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExcelCell" forIndexPath:indexPath];

    cell.sourceArr = self.sourceArray[indexPath.row];
    
    return cell;
}

//同步左侧右侧
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = self.rightTableV.contentOffset.y;
    
    CGPoint timeOffsetY = self.leftView.tableV.contentOffset;
    
    timeOffsetY.y = offsetY;
    
    self.leftView.tableV.contentOffset = timeOffsetY;
    
    if(offsetY == 0) {
        
        self.leftView.tableV.contentOffset=CGPointZero;
    }
}

@end
