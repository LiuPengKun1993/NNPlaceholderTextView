//
//  NNViewController.m
//  NNPlaceholderTextView
//
//  Created by iOS on 16/10/4.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNViewController.h"
#import "NNPostWordViewController.h"
#import "NNNavigationController.h"

@interface NNViewController ()

@end

@implementation NNViewController
- (IBAction)senderBtn {
    NNPostWordViewController *postWordVC = [[NNPostWordViewController alloc] init];
    
    NNNavigationController *navigationVC = [[NNNavigationController alloc] initWithRootViewController:postWordVC];
    
    [self presentViewController:navigationVC animated:YES completion:nil];
}



@end
