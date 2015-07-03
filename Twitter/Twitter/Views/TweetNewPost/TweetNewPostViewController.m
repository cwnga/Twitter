//
//  TweetNewPostViewController.m
//  Twitter
//
//  Created by Anson Ng on 7/1/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetNewPostViewController.h"
#import "TwitterClient.h"
#import "AccountManager.h"
@interface TweetNewPostViewController ()
@property (weak, nonatomic) IBOutlet UITextView *statusTextView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) User *user;

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
- (void)setupView
{
    [super setupView];
    
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStylePlain target:self action:@selector(tapSendButton)];
    
    self.user = (User *)[AccountManager currentUser];
    NSURL *imageURL = [[NSURL alloc] initWithString:self.user.profileImageUrl];
    [self.userImageView sd_setImageWithURL:imageURL placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error) {
            self.userImageView.image = image;
        }
    }];
    
}
- (void)tapSendButton
{
     NSString *status = self.statusTextView.text;
    
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
