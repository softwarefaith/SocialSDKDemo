//
//  ViewController.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "ViewController.h"
#import "MLSoicalUIManager.h"
#import "MLSocialManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *closedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closedButton.frame = CGRectMake(100, 100, 100, 100);
    closedButton.backgroundColor = [UIColor redColor];
    [closedButton setTitle:@"123345" forState:UIControlStateNormal];
    [closedButton addTarget:self action:@selector(closedWindwAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closedButton];
    
  
    

    
}
- (void)closedWindwAction{
         [MLSoicalUIManager showShareViewWithChannels:@[@(MLResourceTypeWechat),@(MLResourceTypeFriend),@(MLResourceTypeQQ),@(MLResourceTypeCopy)] completionBlock:^(BOOL isCancel, MLResourceType reourcesType) {
             
             if (!isCancel) {
                 
                 
                 if(MLResourceTypeCopy == reourcesType) {
                     UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                     pasteboard.string = @"http://192.168.50.107/yqy-h5/page/index.html#test";
                     return ;
                 }
                 
                 id<MLShareInterface> share = [[MLSocialManager defaultManager] getShareProtocolWithChannelType:[MLSoicalUIManager mapFromResourceType:reourcesType]];
                 
            
                 [share shareURL:@"http://192.168.50.107/yqy-h5/page/index.html#test" title:@"就是它,神速解决我的燃眉之急~" description:@"我发现了一款借款神器-最高10000额度,多种期限灵活任选,快来试试看~" thumbnail: [UIImage imageNamed:@"social_logo"]];
                 
                 //[share shareSimpleText:@"你好"];
                 
                 [share setShareCompletionBlock:^(id<MLShareResultInterface> result) {
                     
                     
                     NSLog(@"halo======%@",[result description]);
                     
                     
                     
                 }];
                 
             }
             
         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
