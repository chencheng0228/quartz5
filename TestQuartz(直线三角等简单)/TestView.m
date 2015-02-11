//
//  TestView.m
//  TestQuartz(直线三角等简单)
//
//  Created by admin on 15-1-13.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// 当自定义view第一次显示出来的时候就会调用drawRect方法
//或者view调用：setNeedsDisplay方法的时候也会调用drawRect方法

-(void)drawRect:(CGRect)rect
{
    [self makeLine];//绘制直线
//    [self makeRound];//画图
  
    
    
    
}

//此方法在viewController中以提及

//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
//{
//
//}

//===========================绘制直线============================
-(void)makeLine
{
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置起点
    CGContextMoveToPoint(ctx, 0, 0);
    //设置终点
    CGContextAddLineToPoint(ctx, 100, 100);
    //设置线条的颜色
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    //设置线条宽度
    CGContextSetLineWidth(ctx, 20);
    //设置线条起点终点的样式（圆角）
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 调用OC的方法设置绘图的颜色
    //    [[UIColor purpleColor] setFill];
    //    [[UIColor blueColor] setStroke];
    // 调用OC的方法设置绘图颜色(同时设置了实心和空心)
    //    [[UIColor greenColor] set];
    
    //渲染空心线  === 渲染实心线：CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
    
}

//===========================绘制图（圆）============================
-(void)makeRound
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画圆
    CGContextAddArc(ctx, 100, 100, 50, 0, 2 * M_PI, 0);
    //上色
    [[UIColor greenColor] set];
    // 3.渲染 (注意, 画线只能通过空心来画)
    CGContextFillPath(ctx);
  //CGContextStrokePath(ctx);
    
}

//===========================绘制图（椭圆）============================

-(void)ellipse
{
    // 画椭圆
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 100, 230));
    
    [[UIColor purpleColor] set];
    
    // 3.渲染
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}
//=====================绘制圆弧================
-(void)makeYuanHU
{
    // 画圆弧
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆弧
    // x/y 圆心
    // radius 半径
    // startAngle 开始的弧度
    // endAngle 结束的弧度
    // clockwise 画圆弧的方向 (0 顺时针, 1 逆时针)
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI_2, 0);
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);
    
    // 3.渲染
    //     CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}
//=========================绘制饼状（扇形）===========
-(void)makeBingZhuang
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画饼状图
    // 画线
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 100, 150);
    // 画圆弧
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI, M_PI_2, 1);
    
    // 关闭路径
    CGContextClosePath(ctx);
    [[UIColor brownColor]set];
    
    
    // 3.渲染 (注意, 画线只能通过空心来画)
    CGContextFillPath(ctx);
    //CGContextStrokePath(ctx);
}


//========================绘制三角================
-(void)makeSanJiao
{
    //1.获得图形上下文
         CGContextRef ctx=UIGraphicsGetCurrentContext();
    
         //2.绘制三角形
         //设置起点
         CGContextMoveToPoint(ctx, 20, 100);
         //设置第二个点
         CGContextAddLineToPoint(ctx, 40, 300);
         //设置第三个点
         CGContextAddLineToPoint(ctx, 200, 200);
         //设置终点
         // CGContextAddLineToPoint(ctx, 20, 100);
         //关闭起点和终点
         CGContextClosePath(ctx);
         // 3.渲染图形到layer上
         CGContextStrokePath(ctx);
}

@end
