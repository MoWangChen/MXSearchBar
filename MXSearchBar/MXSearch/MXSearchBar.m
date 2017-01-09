//
//  MXSearchBar.m
//  MXSearchBar
//
//  Created by 谢鹏翔 on 2017/1/9.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "MXSearchBar.h"

@interface MXSearchBar ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation MXSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initSearchBarSetting];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initSearchBarSetting];
    }
    
    return self;
}

#pragma mark - lazy load
- (void)initSearchBarSetting
{
//    self.backgroundColor = [UIColor colorWithRed:50 green:50 blue:50 alpha:0.8];
    self.backgroundColor = [UIColor lightGrayColor];
    
    [self loadTextField];
}

- (void)loadTextField
{
    if (_textField == nil) {
        CGRect frame = (CGRect){{5,self.bounds.size.height*0.5 - 15},{self.bounds.size.width - 10, 30}};
        _textField = [[UITextField alloc] initWithFrame:frame];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 5;
        [self addSubview:_textField];
    }
}

@end
