//
//  ViewController.m
//  orderTest
//
//  Created by mac-mini on 2016/12/14.
//  Copyright © 2016年 Podul. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btn setCenter:self.view.center];
    [btn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction:(UIButton *)sender{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"action"  : @"register",
                                 @"name"    : @"test",
                                 @"psd"     : @"000000",
                                 @"tel"     : @""
                                 };
    
    [manager POST:@"https://www.podul.com.cn/api/account.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
//        error_code        为 0 该用户名已存在
//        error_code        为 1 插入数据库失败
//        register_result   为 1 注册成功
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//- (void)btnAction:(UIButton *)sender{
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    NSDictionary *parameters = @{
//                                 @"action"      : @"submitOrder",
//                                 @"food_name"   : @[@"菜1",@"菜2"],    //传array
//                                 @"account_id"  : @"3",
//                                 @"package_name": @"",
//                                 @"price"       : @"12元"
//                                 };
//    
//    [manager POST:@"https://www.podul.com.cn/api/order.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
