//
//  ViewController.m
//  TestQuartz(直线三角等简单)
//
//  Created by admin on 15-1-13.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    //[self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    TestView *view = [[TestView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    
  //使用：：-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
         //1.创建自定义的layer
         CALayer *layer=[CALayer layer];
         //2.设置layer的属性
         layer.backgroundColor=[UIColor brownColor].CGColor;
         layer.bounds=CGRectMake(0, 0, 200, 150);
         layer.anchorPoint=CGPointZero;
         layer.position=CGPointMake(100, 100);
         layer.cornerRadius=20;
         layer.shadowColor=[UIColor blackColor].CGColor;
         layer.shadowOffset=CGSizeMake(10, 20);
         layer.shadowOpacity=0.6;
    
         //设置代理
         layer.delegate=self;
         [layer setNeedsDisplay];
         //3.添加layer
         [self.view.layer addSublayer:layer];
    
}


-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
 {
         //1.绘制图形
         //画一个圆
         CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
         //设置属性（颜色）
         //    [[UIColor yellowColor]set];
         CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
         //2.渲染
         CGContextFillPath(ctx);
    
 }
-(void)buttonAction:(id)sender
{
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
