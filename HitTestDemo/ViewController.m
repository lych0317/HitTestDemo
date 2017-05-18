//
//  ViewController.m
//  HitTestDemo
//
//  Created by yuanchao Li on 2017/5/18.
//  Copyright © 2017年 yuanchao Li. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CustomViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CustomViewController"];
    vc.view.frame = self.view.bounds;
    [self.view addSubview:vc.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
