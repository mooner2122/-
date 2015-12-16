//
//  ViewController.m
//  微信支付
//
//  Created by 震海科技 on 15/12/16.
//  Copyright © 2015年 震海科技. All rights reserved.
//

#import "ViewController.h"
#import "WXApiRequestHandler.h"
#import "WXApiManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInit];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setInit{
    //判断有没有微信客户端，没有则隐藏微信支付按钮
    //    if ([WXApi isWXAppInstalled]){
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"微信支付" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(bizPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //    }
    
}

-(void)bizPay{
    
    NSString *res = [WXApiRequestHandler jumpToBizPay];
    if( ![@"" isEqual:res] ){
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"支付失败" message:res delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alter show];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
