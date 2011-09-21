//
//  EndlessScrollView.h
//  EhlMobile
//
//  Created by Sebastian Roth on 9/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EndlessScrollViewDelegate;

#define kEndlessScrollViewMaxPagesDefault 9

@interface EndlessScrollView : UIScrollView<UIScrollViewDelegate> {
    id<EndlessScrollViewDelegate> _endlessScrollViewDelegate;
    float _scrollObjWidth;
    UIPageControl *_pageControl;
    NSInteger _maxPages;
}

@property (assign) IBOutlet id<EndlessScrollViewDelegate> endlessScrollViewDelegate;
@property float scrollObjWidth;
@property (nonatomic, retain) UIPageControl *pageControl;
@property NSInteger maxPages;

@end

@protocol EndlessScrollViewDelegate <NSObject>

- (void) endlessScrollView:(EndlessScrollView*) sender 
       currentIndexChanged:(NSInteger)idx;

@end