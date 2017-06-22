//
//  ExcelLeftView.m
//
//
//  Created by df on 2017/6/21.
//  Copyright © 2017年 Dyf. All rights reserved.
//

#import "ExcelLeftView.h"

#import "Constant.h"

@interface ExcelLeftView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *leftArr;

@end

@implementation ExcelLeftView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self prepareLayout];
    }
    
    return self;
}

- (void)prepareLayout {
    
    self.leftArr = [NSMutableArray array];
    
    for (int i = 0; i < leftCellNumber; i++) {
        
        [self.leftArr addObject:[NSString stringWithFormat:@"第%d行",i]];
    }
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:(UITableViewStylePlain)];
    
    NSLog(@"%@---- %@",NSStringFromCGRect(self.frame),NSStringFromCGRect(self.tableV.frame));
    
    [self addSubview:self.tableV];
    
    self.tableV.delegate = self;
    
    self.tableV.dataSource = self;
    
    self.tableV.allowsSelection = NO;
    
    self.tableV.showsVerticalScrollIndicator = NO;
    self.tableV.showsHorizontalScrollIndicator = NO;
    
    self.tableV.userInteractionEnabled = NO;
    
    self.tableV.bounces = NO;
    
    [self.tableV registerClass:[ExcelLeftCell class] forCellReuseIdentifier:@"ExcelLeftCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return leftCellNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ExcelLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExcelLeftCell" forIndexPath:indexPath];
    
    cell.subtypeView.text = self.leftArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cellHeight;
}


@end

@implementation ExcelLeftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor blackColor];
        
        self.subtypeView = [[SubtypeView alloc] initWithFrame:CGRectMake(0, 0, leftWidth - 1, cellHeight - 1)];
        
        self.subtypeView.backgroundColor = [UIColor whiteColor];
        
//        self.subtypeView.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

        
        [self.contentView addSubview:self.subtypeView];
        
    }
    
    return self;
}

@end
