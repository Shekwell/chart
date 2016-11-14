//
//  ViewController.m
//  chart
//
//  Created by faifa on 16/11/11.
//  Copyright © 2016年 faifa. All rights reserved.
//

#import "ViewController.h"

#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor redColor];
    
    //创建坐标系
    
    //横坐标轴
    CAShapeLayer * layer1 = [CAShapeLayer layer];
    layer1.frame = CGRectMake(40,250 , SCREEN_WIDTH-50, 1.5);
    layer1.backgroundColor = [[UIColor blackColor]CGColor];
    [self.view.layer addSublayer:layer1];
    
    CGFloat width = (SCREEN_WIDTH-50)/6;
    
    for (int i = 0; i<=6; i++) {
        if (i!=0) {
            //横坐标点
            CAShapeLayer * layer2 = [CAShapeLayer layer];
            layer2.frame = CGRectMake(i*width, -2, 2, 2.5);
            layer2.backgroundColor = [[UIColor blackColor]CGColor];
            [layer1 addSublayer:layer2];
        }
    }
    
    //横坐标数字
    for (int i = 0; i<=6; i++) {
        CATextLayer * layer3 = [CATextLayer layer];
        layer3.frame = CGRectMake(i*width-5, 5, 30, 20);
        layer3.string = [NSString stringWithFormat:@"%zd",i*50];
        layer3.fontSize = 10;
        layer3.foregroundColor = [[UIColor grayColor] CGColor];
        [layer1 addSublayer:layer3];
    }
    
    
    //纵坐标
    
    //纵坐标轴
    CAShapeLayer * layer4 = [CAShapeLayer layer];
    layer4.frame = CGRectMake(40, 100, 1.5, 150);
    layer4.backgroundColor = [[UIColor blackColor]CGColor];
    [self.view.layer addSublayer:layer4];
    
    //纵坐标点
    for (int i = 0 ; i<=5; i++) {
        if (i!=0) {
            CAShapeLayer * layer5 = [CAShapeLayer layer];
            layer5.frame = CGRectMake(0, i*30, 3, 2);
            layer5.backgroundColor = [[UIColor blackColor]CGColor];
            [layer4 addSublayer:layer5];
        }
    }
    
    //纵坐标数字
    for (int i = 0; i<=5; i++) {
        if (i!=0) {
            CATextLayer * layer6 = [CATextLayer layer];
            layer6.frame = CGRectMake(-25, 150-(i*30)-6, 20, 20);
            layer6.string = [NSString stringWithFormat:@"%zd",i*30];
            layer6.fontSize = 10;
            layer6.alignmentMode = kCAAlignmentRight;
            layer6.foregroundColor = [[UIColor grayColor]CGColor];
            [layer4 addSublayer:layer6];
        }
    }
    
    //坐标数字
    NSArray * pathx = @[@20,@50,@70,@100,@130,@170,@200,@240,@260];
    NSArray *pathY = @[@10,@60,@50,@100,@60,@95,@54,@120,@80];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [[UIColor clearColor] CGColor];
    layer.lineWidth = 1.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = [[UIColor orangeColor] CGColor];
    [self.view.layer addSublayer:layer];
    
    CGPoint point;
    
    //创建贝塞尔路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    //x.y轴倍率
    CGFloat BLX = (SCREEN_WIDTH-50)/300;
    CGFloat BLY = 1;
    
    for (int i = 0; i<=8; i++) {
        CGFloat x = [pathx[i] floatValue] *BLX +40;
        CGFloat y = 250-[pathY[i] floatValue] * BLY;
        point = CGPointMake(x, y);
        if (i==0) {
            [path moveToPoint:point];//起点
        }
        
        [path addLineToPoint:point];
    }
    
    //关联layer和贝塞尔
    layer.path = path.CGPath;
    
    //创建动画
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(3.0);
    animation.autoreverses = NO;
    animation.duration = 3.0;
    
    //layer的动画
    [layer addAnimation:animation forKey:nil];
    layer.strokeEnd = 1;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
