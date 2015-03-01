//
//  ProfileViewController.m
//  Teachers
//
//  Created by Rodrigo Andrade on 2/28/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

#pragma mark - Custom Methods

- (void)showActivityIndicator:(BOOL)showActivity {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:showActivity];
    [self.activityIndicator setHidden:!showActivity];
}

#pragma mark - Methods of UIWebViewController (Delegate)

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self showActivityIndicator:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self showActivityIndicator:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self showActivityIndicator:NO];
}

#pragma mark - Methods of this ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.teacher.name;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.teacher.linkedin]];
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
