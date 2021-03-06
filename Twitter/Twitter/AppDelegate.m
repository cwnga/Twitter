//
//  AppDelegate.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TwitterClient.h"
#import "TweetListViewController.h"
#import "AccountManager.h"
#import "Const.h"

@interface AppDelegate ()
@property (strong, nonatomic) UINavigationController *navigationController;
@end

@implementation AppDelegate

#pragma mark - customize
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userDidLogout) name:UserDidLogoutNotification object:nil];
    User *user = [AccountManager currentUser];
    if (user != nil) {
        NSLog(@"welcome , %@", user.name);
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[TweetListViewController alloc] init]];
    } else {
        NSLog(@"NOT login");
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
        
    }
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [[TwitterClient sharedInstance] openURL:url];
    return YES;
}

#pragma mark - org

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)userDidLogout
{
    //   self.window.rootViewController = self.navigationController;
    
    [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}
@end
