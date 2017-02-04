//
//  MXSearchResultController.m
//  MXSearchBar
//
//  Created by 谢鹏翔 on 2017/2/3.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "MXSearchResultController.h"
#import "MXSearchBar.h"

#define kMXScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kMXScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface MXSearchResultController ()

@property (nonatomic, strong) MXSearchBar *searchBar;
@property (nonatomic, weak) UIViewController *parentController;

@end

@implementation MXSearchResultController

- (instancetype)initWithSearchBar:(MXSearchBar *)searchBar contentsController:(UIViewController *)viewController
{
    NSAssert(searchBar != nil,@"%s,%d,%s", __FUNCTION__, __LINE__, __FILE__);
    NSAssert(viewController != nil,@"%s,%d,%s", __FUNCTION__, __LINE__, __FILE__);
    self = [super init];
    if (self) {
        self.searchBar = searchBar;
        self.parentController = viewController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDefaultView];
}

- (void)setupDefaultView
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    for (int i = 0; i < 3; i++) {
        
        CGRect frame = (CGRect){{0,0},{40,40}};
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.text = [NSString stringWithFormat:@"test%d",i];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 20;
        label.layer.borderColor = [UIColor purpleColor].CGColor;
        label.layer.borderWidth = 1;
        [self.view addSubview:label];
        
        CGFloat x = kMXScreenWidth/6 * (2 * i + 1);
        CGFloat y = kMXScreenHeight / 4;
        label.center = CGPointMake(x, y);
    }
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancleButton.frame = (CGRect){{0,0},{50,20}};
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(resignActiveSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancleButton];
    cancleButton.center = self.view.center;
}

- (void)resignActiveSearch
{
    [self setActive:NO animated:YES];
}

- (void)setActive:(BOOL)visible animated:(BOOL)animated
{
    if (visible) {
        [self.parentController presentViewController:self animated:animated completion:nil];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
