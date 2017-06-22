//
//  ClassifyView.m
//  
//
//  Created by df on 2017/6/21.
//  Copyright © 2017年 Dyf. All rights reserved.
//

#import "ClassifyView.h"

#import "Constant.h"

@implementation ClassifyView


- (void)drawRect:(CGRect)rect {
    
    
    CAShapeLayer *solidShapeLayer = [CAShapeLayer layer];
    CGMutablePathRef solidShapePath =  CGPathCreateMutable();
    [solidShapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [solidShapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
    solidShapeLayer.lineWidth = 1.0f ;
    CGPathMoveToPoint(solidShapePath, NULL, leftWidth/2, 0);
    CGPathAddLineToPoint(solidShapePath, NULL, leftWidth,mHeight);
    [solidShapeLayer setPath:solidShapePath];
    CGPathRelease(solidShapePath);
    [self.layer addSublayer:solidShapeLayer];
    
    
    CAShapeLayer *solidShapeLayer2 = [CAShapeLayer layer];
    CGMutablePathRef solidShapePath2 =  CGPathCreateMutable();
    [solidShapeLayer2 setFillColor:[[UIColor clearColor] CGColor]];
    [solidShapeLayer2 setStrokeColor:[[UIColor blackColor] CGColor]];
    solidShapeLayer2.lineWidth = 1.0f ;
    CGPathMoveToPoint(solidShapePath2, NULL, 0, mHeight/2);
    CGPathAddLineToPoint(solidShapePath2, NULL, leftWidth,mHeight);
    [solidShapeLayer2 setPath:solidShapePath2];
    CGPathRelease(solidShapePath2);
    [self.layer addSublayer:solidShapeLayer2];
    
    
    [@"类型" drawInRect:CGRectMake(leftWidth/2+20,  5, leftWidth/2-10, 15) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    
    
    [@"单位" drawInRect:CGRectMake(5,  mHeight/2+10, leftWidth/2, 15) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    
    [@"数量" drawInRect:CGRectMake(20,  mHeight/4, leftWidth/2, 15) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    

    
}

@end
