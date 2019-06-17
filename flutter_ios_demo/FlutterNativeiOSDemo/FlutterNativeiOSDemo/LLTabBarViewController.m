//
//  LLTabBarViewController.m
//  FlutterNativeiOSDemo
//
//  Created by lichengwu on 2019/5/9.
//  Copyright © 2019 cwli. All rights reserved.
//

#import "LLTabBarViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface LLTabBarViewController ()

@end

@implementation LLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *firstVC = [[ViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstNav.title = @"第一tab";
    [self addChildViewController:firstNav];
    
    
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    secondNav.title = @"第二tab";
    [self addChildViewController:secondNav];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
