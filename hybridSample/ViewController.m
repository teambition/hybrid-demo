//
//  ViewController.m
//  hybridSample
//
//  Created by Zhang Zeqing on 23/10/13.
//  Copyright (c) 2013 Zhang Zeqing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) NSURLRequest *request;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:nil];
    
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
    self.request = request;
    NSString *path = request.URL.relativePath;
    if ([path isEqualToString:@"/about"]) {
        [self showBlueView];
        return NO;
    } else if ([path isEqualToString:@"/showAlert"]) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"This is alert view." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [av show];
        return NO;
    }
    return YES;
}

#pragma - 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBlueView"]) {
        UIViewController *viewController = segue.destinationViewController;
        viewController.title = @"About";
    }
}

@end
