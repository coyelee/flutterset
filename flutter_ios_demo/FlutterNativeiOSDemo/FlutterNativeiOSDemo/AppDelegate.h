//
//  AppDelegate.h
//  FlutterNativeiOSDemo
//
//  Created by lichengwu on 2019/5/9.
//  Copyright © 2019 cwli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>

@interface AppDelegate : FlutterAppDelegate <UIApplicationDelegate,FlutterAppLifeCycleProvider>

@property (strong, nonatomic) UIWindow *window;


@end

