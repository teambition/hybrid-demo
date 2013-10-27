//
//  ViewController.m
//  hybridSample
//
//  Created by Zhang Zeqing on 23/10/13.
//  Copyright (c) 2013 Zhang Zeqing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Helper

- (void)showBlueView {
    [self performSegueWithIdentifier:@"showBlueView" sender:self];
}

#pragma - WebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"navigationType: %d, request: %@", navigationType, request);
    if (navigationType == UIWebViewNavigationTypeOther) {
        return YES;
    }
    [self showBlueView];
    return NO;
}

@end
