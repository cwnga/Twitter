//
//  TweetNewPostViewController.m
//  Twitter
//
//  Created by Anson Ng on 7/1/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetNewPostViewController.h"
#import "TwitterClient.h"
@interface TweetNewPostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *statusText;

@end

@implementation TweetNewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapSendButton:(id)sender
{
    NSString *status = self.statusText.text;
    [[TwitterClient sharedInstance] insertNewPost:status completion:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"post success:%@", response);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        NSLog(@"post fail:%@", err);
        
    }];

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
