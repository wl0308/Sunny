//
//  ViewController.m
//  WriteSomething
//
//  Created by 罗钰慧 on 16/4/20.
//  Copyright (c) 2016年 罗钰慧. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <SDCycleScrollView.h>
@interface ViewController ()
@property (nonatomic,strong) UITextField *phoneNum;
@property (nonatomic,strong) UITextField *numCode;
@property (nonatomic,strong) UIButton *getCode;
@property (nonatomic,strong) SDCycleScrollView *myScrollView;
@property (nonatomic,strong) NSMutableArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneNum = [[UITextField alloc] init];
    self.phoneNum.layer.borderWidth = 0.8;
    self.phoneNum.layer.cornerRadius = 3.0;
    self.phoneNum.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.phoneNum.layer.masksToBounds = YES;
    self.phoneNum.placeholder = @"手机号";
    [self.view addSubview:self.phoneNum];
    [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@40);
        make.top.equalTo(self.view).with.offset(150);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
    }];
    
    self.numCode = [[UITextField alloc] init];
    self.numCode.layer.borderWidth = 0.8;
    self.numCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.numCode.layer.cornerRadius = 3.0;
    self.numCode.layer.masksToBounds = YES;
    self.numCode.placeholder = @"验证码";
    [self.view addSubview:self.numCode];
    
    self.getCode = [[UIButton alloc] init];
    [self.getCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getCode setTitle:@"获取验证码" forState:UIControlStateHighlighted];
    [self.getCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.getCode setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    self.getCode.backgroundColor = [UIColor colorWithRed:245.0 / 255.0f green:245.0 / 255.0f blue:245.0 / 255.0f alpha:1];
    self.getCode.layer.borderWidth = 0.8;
    self.getCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.getCode.layer.cornerRadius = 3;
    self.getCode.layer.masksToBounds = YES;
    [self.getCode addTarget:self action:@selector(getupCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.getCode];
    
    [self.numCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@40);
        make.top.equalTo(self.phoneNum.mas_bottom).with.offset(20);
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.right.equalTo(self.getCode.mas_left).with.offset (-10);
        make.width.equalTo(self.numCode);
        
    }];
    
    [self.getCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@40);
        make.top.equalTo(self.phoneNum.mas_bottom).with.offset(20);
        make.left.equalTo(self.numCode.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.width.equalTo(self.numCode);
    }];
    
    self.images = [NSMutableArray array];
    UIImage *img1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"3.jpg"];
    [self.images addObject:img1];
    [self.images addObject:img2];
    [self.images addObject:img3];
    self.myScrollView = [[SDCycleScrollView alloc] init];
    self.myScrollView.localizationImageNamesGroup = [self.images copy];
    [self.view addSubview:self.myScrollView];
    [self.myScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@160);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-40);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
    }];
    
}


- (void)getupCode {
}


@end
