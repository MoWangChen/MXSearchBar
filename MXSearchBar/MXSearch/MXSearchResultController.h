//
//  MXSearchResultController.h
//  MXSearchBar
//
//  Created by 谢鹏翔 on 2017/2/3.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MXSearchBar;
@interface MXSearchResultController : UIViewController

- (instancetype)initWithSearchBar:(MXSearchBar *)searchBar contentsController:(UIViewController *)viewController;

- (void)setActive:(BOOL)visible animated:(BOOL)animated;

@end
