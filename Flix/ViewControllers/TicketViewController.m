//
//  TicketViewController.m
//  Flix
//
//  Created by Nicolas Machado on 6/28/18.
//  Copyright © 2018 Nicolas Machado. All rights reserved.
//

#import "TicketViewController.h"
#import <WebKit/WebKit.h>

@interface TicketViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *ticketWebView;
@end

@implementation TicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *baseURLString = @"https://www.fandango.com/search?q=";
    NSString *movieString = self.movie[@"title"];
    CGFloat index = [movieString rangeOfString:@" "].location;
    NSString *movieSearchString = [movieString substringToIndex:index];
    NSString *endURLString = @"&mode=general";
    
    NSString *firstURLString = [baseURLString stringByAppendingString:movieSearchString];
    NSString *fullURLString = [firstURLString stringByAppendingString:endURLString];
    NSURL *url = [NSURL URLWithString:fullURLString];
    
    // Place the URL in a URL Request.
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:10.0];
    // Load Request into WebView.
    [self.ticketWebView loadRequest:request];
    
    //https://www.youtube.com/watch?v=\(key)
    // Do any additional setup after loading the view.
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
