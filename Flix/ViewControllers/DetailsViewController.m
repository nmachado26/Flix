//
//  DetailsViewController.m
//  Flix
//
//  Created by Nicolas Machado on 6/27/18.
//  Copyright © 2018 Nicolas Machado. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TrailerViewController.h"
#import "TicketViewController.h"
//#import "MoviesViewController.m"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *backgroundLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.backgroundLabel.layer.cornerRadius = 10;
    self.backgroundLabel.clipsToBounds = true;
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    NSString *baseURLStringLowRes = @"https://image.tmdb.org/t/p/w45";
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLStringLowRes = [baseURLStringLowRes stringByAppendingString:backdropURLString];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    
    NSURL *backdropURLLowRes = [NSURL URLWithString:fullBackdropURLStringLowRes];
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    
    NSURLRequest *requestSmall = [NSURLRequest requestWithURL:backdropURLLowRes];
    NSURLRequest *requestLarge = [NSURLRequest requestWithURL:backdropURL];
    
    __weak DetailsViewController *weakSelf = self;
    
    [self.backdropView setImageWithURLRequest:requestSmall placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *smallImage) {
            // smallImageResponse will be nil if the smallImage is already available
            // in cache (might want to do something smarter in that case).
            weakSelf.backdropView.alpha = 0.0;
            weakSelf.backdropView.image = smallImage;
            [UIView animateWithDuration:0.3 animations:^{
                 weakSelf.backdropView.alpha = 1.0; } completion:^(BOOL finished) {
                       // The AFNetworking ImageView Category only allows one request to be sent at a time
                       // per ImageView. This code must be in the completion block.
                       [weakSelf.backdropView setImageWithURLRequest:requestLarge placeholderImage:smallImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage * largeImage) {
                               weakSelf.backdropView.image = largeImage;
                            }
                            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                // do something for the failure condition of the large image request
                                // possibly setting the ImageView's image to a default image
                            }];
                 }];
         }
         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
               // do something for the failure condition
                // possibly try to get the large image
         }];
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    //adjust size. add scrollView property
    CGFloat maxHeight = self.synopsisLabel.frame.origin.y + self.synopsisLabel.frame.size.height + 80;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, maxHeight);
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TrailerViewController *trailerViewController = [segue destinationViewController];
    trailerViewController.movie = self.movie;
    TicketViewController *ticketViewController = [segue destinationViewController];
    ticketViewController.movie = self.movie;
}

@end
