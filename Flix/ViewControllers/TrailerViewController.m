//
//  TrailerViewController.m
//  Flix
//
//  Created by Nicolas Machado on 6/28/18.
//  Copyright © 2018 Nicolas Machado. All rights reserved.
//

#import "TrailerViewController.h"
#import <WebKit/WebKit.h>

@interface TrailerViewController ()
@property (nonatomic, strong) NSArray *trailers;
@property (weak, nonatomic) IBOutlet WKWebView *trailerWebView;
@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchTrailers];
    

}

- (void)fetchTrailers{
    //get url
    NSString *baseTrailersURLString = @"https://api.themoviedb.org/3/movie/";
    NSNumber *movie_id = self.movie[@"id"];
    NSString *endTrailersURLString = @"/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US";
    NSString *midTrailersURLString = [baseTrailersURLString stringByAppendingString:movie_id.stringValue];
    NSString *fullTrailersURLString = [midTrailersURLString stringByAppendingString:endTrailersURLString];
    //https://api.themoviedb.org/3/movie/260513/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US
    
    NSURL *url = [NSURL URLWithString:fullTrailersURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            //alert, doesnt call anything
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Cannot Get Movies" message:@"The internet connection seems to be offline" preferredStyle:UIAlertControllerStyleAlert];
            [alertView addAction:[UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }]];
            [self presentViewController:alertView animated:YES completion:nil];
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.trailers = dataDictionary[@"results"];
            
            
            NSString *baseYoutubeURLString = @"https://www.youtube.com/watch?v=";
            // Convert the url String to a NSURL object.
            NSDictionary *trailer = [self.trailers firstObject];
            NSString *key = trailer[@"key"];
            NSString *finalYoutubeURLString = [baseYoutubeURLString stringByAppendingString:key];
            NSURL *finalYoutubeURL = [NSURL URLWithString:finalYoutubeURLString];
            
            // Place the URL in a URL Request.
            NSURLRequest *request = [NSURLRequest requestWithURL:finalYoutubeURL
                                                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                 timeoutInterval:10.0];
            // Load Request into WebView.
            [self.trailerWebView loadRequest:request];
            
            //https://www.youtube.com/watch?v=\(key)
            // Do any additional setup after loading the view.
            
            
            //[self.tableView reloadData];
            // TODO: Get the array of movies
            // TODO: Store the movies in a property to use elsewhere
            // TODO: Reload your table view data
        }
        //[self.refreshControl endRefreshing];
        //[self.activityIndicator stopAnimating];
    }];
    [task resume];
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
