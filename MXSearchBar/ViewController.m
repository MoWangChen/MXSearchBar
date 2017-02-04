//
//  ViewController.m
//  MXSearchBar
//
//  Created by 谢鹏翔 on 2017/1/9.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ViewController.h"
#import "MXSearchBar.h"
#import "MXSearchResultController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MXSearchBar *searchBar;
@property (nonatomic, strong) MXSearchResultController *resultController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MXSearchBar";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"-- %2ld --",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.resultController setActive:YES animated:YES];
}

#pragma mark - lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.searchBar;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    }
    
    return _tableView;
}

- (MXSearchBar *)searchBar
{
    if (_searchBar == nil) {
        CGRect frame = (CGRect){{0,0},{kScreenWidth,40}};
        _searchBar = [[MXSearchBar alloc] initWithFrame:frame];
    }
    
    return _searchBar;
}

- (MXSearchResultController *)resultController
{
    if (_resultController == nil) {
        _resultController = [[MXSearchResultController alloc] initWithSearchBar:self.searchBar contentsController:self];
    }
    
    return _resultController;
}

@end
