//
//  ViewController.h
//  hybridSample
//
//  Created by Zhang Zeqing on 23/10/13.
//  Copyright (c) 2013 Zhang Zeqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol ThingJSExports <JSExport>
- (void)showBlueView;
@end

@interface ViewController : UIViewController <ThingJSExports, UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
