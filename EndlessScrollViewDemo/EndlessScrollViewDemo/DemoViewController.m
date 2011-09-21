//
//  DemoViewController.m
//  EndlessScrollViewDemo
//
//  Created by Sebastian Roth on 9/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DemoViewController.h"

@implementation DemoViewController
@synthesize scrollView=_scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

    [self addImage:[UIImage imageNamed:@"6168606240_1b15c5fee7_b.jpg"]];
    [self addImage:[UIImage imageNamed:@"6167956098_61a63d2c63_b.jpg"]];
    [self addImage:[UIImage imageNamed:@"3049137030_98c253d47e_o.jpg"]];
    [self addImage:[UIImage imageNamed:@"6168606240_1b15c5fee7_b.jpg"]];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Helper functions

- (void) addImage:(UIImage*) image {
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];

    iv.frame = CGRectMake(([self.scrollView.subviews count]) * self.scrollView.frame.size.width, 0, 
                          self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.scrollView addSubview:iv];
}

#pragma mark - EndlessScrollViewDelegate

- (void)endlessScrollView:(EndlessScrollView *)sender currentIndexChanged:(NSInteger)idx {
    
}

- (void)dealloc {
    [_scrollView release];
    [super dealloc];
}
@end
