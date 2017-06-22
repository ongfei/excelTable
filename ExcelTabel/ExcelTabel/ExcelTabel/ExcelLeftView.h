//
//  ExcelLeftView.h
//  
//
//  Created by df on 2017/6/21.
//  Copyright © 2017年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubtypeView.h"

@interface ExcelLeftView : UIView

@property (nonatomic, strong) UITableView *tableV;

@end

@interface ExcelLeftCell : UITableViewCell

@property (nonatomic, strong) SubtypeView *subtypeView;

@end
