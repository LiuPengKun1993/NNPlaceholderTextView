//
//  NNPostWordViewController.m
//  NNPlaceholderTextView
//
//  Created by iOS on 16/10/4.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNPostWordViewController.h"
#import "NNPlaceholderTextView.h"
#import "UIView+NNExtension.h"
#import "SVProgressHUD.h"

@interface NNPostWordViewController ()

@property (nonatomic, strong) NNPlaceholderTextView *textView;
@end

@implementation NNPostWordViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTextView];
}

- (void)setupTextView {
    
    NNPlaceholderTextView *textView = [[NNPlaceholderTextView alloc] init];
    textView.frame = self.view.bounds;
    
    // 占位文字自定义
    textView.placeholder = @" Hello ! Nice to meet you !";
    
    // 占位文字的大小自定义
    textView.font = [UIFont systemFontOfSize:20];

    // 占位文字的颜色自定义
    textView.placeholderColor = [UIColor grayColor];
    
//    textView.text = @"liuzhongning";
//    textView.textColor = [UIColor blueColor];
    
//    textView.width = 300;
//    textView.height = 200;
//    
    [self.view addSubview:textView];
    self.textView = textView;
    
}

- (void)setupNav {
    self.title = @"发表文字";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)post
{
    if (self.textView.hasText) {
        [SVProgressHUD showSuccessWithStatus:@"模拟发表成功"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    } else {
        [SVProgressHUD showErrorWithStatus:@"请输入文字后再发表"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
    [self test];
}

- (void)test {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    [self.view endEditing:YES];
}

@end
