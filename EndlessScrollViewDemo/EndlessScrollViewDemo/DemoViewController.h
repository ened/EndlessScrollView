//
//  DemoViewController.h
//  EndlessScrollViewDemo
//
//  Created by Sebastian Roth on 9/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EndlessScrollView.h"

@interface DemoViewController : UIViewController<EndlessScrollViewDelegate> {
    EndlessScrollView *_scrollView;
}

@property (nonatomic, retain) IBOutlet EndlessScrollView *scrollView;

- (void) addImage:(UIImage *) image;

@end
