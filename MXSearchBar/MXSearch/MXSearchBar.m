//
//  MXSearchBar.m
//  MXSearchBar
//
//  Created by 谢鹏翔 on 2017/1/9.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "MXSearchBar.h"

#define kMXSearchBar_LeftMargin 5.f

@interface MXSearchBar ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *placeholderLabel;



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

#pragma mark - Public Method
- (void)mx_resignFirstResponder
{
    [self.textField resignFirstResponder];
}

- (void)searchKeywordChanged:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField       // return NO to disallow editing.
{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField           // became first responder
{
    NSLog(@"textFieldDidBeginEditing");
    [self textFieldDidBeginEditingAnimate];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
{
    NSLog(@"textFieldDidEndEditing");
    [self textFieldDidEndEditingAnimate];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string   // return NO to not change text
{
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField               // called when clear button pressed. return NO to ignore (no notifications)
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    return YES;
}

#pragma mark - private animate
- (void)textFieldDidBeginEditingAnimate
{
    [UIView animateWithDuration:0.3 animations:^{
    
        CGSize size = self.placeholderLabel.frame.size;
        self.placeholderLabel.center = CGPointMake(kMXSearchBar_LeftMargin + size.width * 0.5, self.bounds.size.height * 0.5);
    } completion:^(BOOL finished) {
        self.placeholderLabel.hidden = YES;
        self.textField.placeholder = self.placeholderLabel.text;
    }];
}

- (void)textFieldDidEndEditingAnimate
{
    [UIView animateWithDuration:0.1 animations:^{
        self.textField.text = @"";
        self.textField.placeholder = @"";
    } completion:^(BOOL finished) {
        self.placeholderLabel.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            _placeholderLabel.center = self.center;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

#pragma mark - lazy load
- (void)initSearchBarSetting
{
    self.backgroundColor = [UIColor lightGrayColor];
    [self loadTextField];
    [self loadPlaceholderLabel];
}

- (void)loadTextField
{
    if (_textField == nil) {
        CGRect frame = (CGRect){{kMXSearchBar_LeftMargin,self.bounds.size.height*0.5 - 15},{self.bounds.size.width - kMXSearchBar_LeftMargin * 2, 30}};
        _textField = [[UITextField alloc] initWithFrame:frame];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 5;
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(searchKeywordChanged:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_textField];
    }
}

- (void)loadPlaceholderLabel
{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.text = @"search";
        _placeholderLabel.textColor = [UIColor darkGrayColor];
        _placeholderLabel.font = [UIFont systemFontOfSize:15];
        [_placeholderLabel sizeToFit];
        [self addSubview:_placeholderLabel];
        _placeholderLabel.center = self.center;
    }
}

@end
