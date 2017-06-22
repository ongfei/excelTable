//
//  ExcelCell.m
//
//
//  Created by df on 2017/6/21.
//  Copyright © 2017年 Dyf. All rights reserved.
//

#import "ExcelCell.h"

#import "SubtypeView.h"

#import "Constant.h"

@interface ExcelCell ()

@property (nonatomic, strong) NSMutableArray<UILabel *> *labelArr;

@end

@implementation ExcelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self prepareLayout];
    }
    
    return self;
}

- (void)prepareLayout {
    

    
    self.labelArr = [NSMutableArray arrayWithCapacity:12];
    
    self.contentView.backgroundColor = [UIColor blackColor];
    
    for (int i = 0; i < columnNumber; i++) {
        
        SubtypeView *headView=[[SubtypeView alloc]initWithFrame:CGRectMake(i * (mWidth + 0.5), 0, mWidth - 0.5, cellHeight - 1)];
        
//         headView.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
        headView.backgroundColor = [UIColor whiteColor];
        
        headView.text = [NSString stringWithFormat:@"%d",i];
        
        
        [self.contentView addSubview:headView];
        
        [self.labelArr addObject:headView];
        
    }
    
    
}

- (void)setSourceArr:(NSArray *)sourceArr {
    
    _sourceArr = sourceArr;
    
    for (int i = 0; i < sourceArr.count; i++) {
        
        self.labelArr[i].text = self.sourceArr[i];
    }
}

@end
