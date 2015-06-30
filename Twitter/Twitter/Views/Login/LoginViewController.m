//
//  LoginViewController.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
#import "TweetListViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)onLogin:(id)sender {
    /*
     Request token URL	https://api.twitter.com/oauth/request_token
     Authorize URL	https://api.twitter.com/oauth/authorize
     Access token URL	https://api.twitter.com/oauth/access_token
     */
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if (user != nil) {
            NSLog(@"welcome to %@", user.name);
            [self presentViewController:[[TweetListViewController alloc]init]  animated:YES completion:nil];
        } else {
        
        }
    }];
  

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
