//
//  EndlessScrollView.m
//  EhlMobile
//
//  Created by Sebastian Roth on 9/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EndlessScrollView.h"

@implementation EndlessScrollView

@synthesize endlessScrollViewDelegate=_endlessScrollViewDelegate;
@synthesize scrollObjWidth=_scrollObjWidth;
@synthesize pageControl=_pageControl;
@synthesize maxPages=_maxPages;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.maxPages = kEndlessScrollViewMaxPagesDefault;
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 30,
                                                                           self.frame.size.width, 30)];
    }
    
    return self;
}

- (void)dealloc {
    self.pageControl = nil;
    
    [super dealloc];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    [self.superview addSubview:self.pageControl];
}

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    
    if(self.scrollObjWidth == 0) {
        self.scrollObjWidth = view.frame.size.width;
    }
    
    self.pageControl.numberOfPages = [self.subviews count] - 1;
    
    if([self.subviews count] == 1 || [self.subviews count]-1 > self.maxPages) {
        self.pageControl.hidden = YES;
    } else {
        self.pageControl.hidden = NO;
    }
    
    self.contentSize = CGSizeMake(([self.subviews count] + 1) * self.frame.size.width, 
                                  [self bounds].size.height);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView {
    CGPoint offset = self.contentOffset;
    int idx =0;
    if(offset.x == 0 || offset.x >= self.scrollObjWidth*([self.subviews count]-1)) {
        self.pageControl.currentPage = idx;
    } else {
        idx = offset.x / self.scrollObjWidth;
        self.pageControl.currentPage = idx;
    }
    
    [self.endlessScrollViewDelegate endlessScrollView:self currentIndexChanged:idx];
}

- (void) scrollViewDidScroll:(UIScrollView *)_scrollView {
	CGSize constrainedContentSize = CGSizeMake(self.scrollObjWidth*([self.subviews count]-1), 0);
	while (self.contentOffset.x < 0) {
		CGPoint offset = self.contentOffset;
		offset.x += constrainedContentSize.width;
		self.contentOffset = offset;
	}
    while (self.contentOffset.x > constrainedContentSize.width) {
		CGPoint offset = self.contentOffset;
		offset.x -= constrainedContentSize.width;
        self.contentOffset = offset;
	}}

@end
