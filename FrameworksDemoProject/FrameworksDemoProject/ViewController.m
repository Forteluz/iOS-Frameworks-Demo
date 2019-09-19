//
//  ViewController.m
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iOS-Frameworks-Demo";
    
    ///< Base View
    if (!_tableView) {
        UITableView *one = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [one setDelegate:self];
        [one setDataSource:self];
        [one registerClass:UITableViewCell.class forCellReuseIdentifier:@"kTableViewCell"];
        [self.view addSubview:one];
        [self setTableView:one];
    }
    
    ///< Base Data
    NSDictionary *UIKit = @
    {
        @"name"  : @"UIKit",
        @"items" : @[@"UIView",@"UIWindow"],
    };
    NSDictionary *QuartzCore = @
    {
        @"name"  : @"QuartzCore",
        @"items" : @[@"CALayer",@"CAAnimation"]
    };
    self.data = @[
                  UIKit,
                  QuartzCore,
                  ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kTableViewCell"];
    NSDictionary *dict = [self.data objectAtIndex:indexPath.section];
    cell.textLabel.text = [[dict objectForKey:@"items"] objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    NSDictionary *dict = self.data[section];
    return [[dict objectForKey:@"items"] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = self.data[section];
    return [dict objectForKey:@"name"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *item = self.data[indexPath.section][@"items"][indexPath.row];
    NSString *clsName = [NSString stringWithFormat:@"FD%@ViewController",item];
    if (NSClassFromString(clsName)) {
        UIViewController *one = [[NSClassFromString(clsName) alloc] init];
        [self.navigationController pushViewController:one animated:YES];
    }
}

#pragma mark - ---| Subviews |---

- (void)addTableViewIfNeeded {
    if (self.tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"kTableViewCell"];
        [self.view addSubview:self.tableView];
    }
}

@end
