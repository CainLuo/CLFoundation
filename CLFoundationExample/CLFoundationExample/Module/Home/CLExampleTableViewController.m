//
//  CLExampleTableViewController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLExampleTableViewController.h"

@interface CLExampleTableViewController ()

@property (nonatomic, strong) NSMutableArray *cl_dataSource;

@end

@implementation CLExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Example";
    
    [self.cl_dataSource addObjectsFromArray:@[@{@"title":@"CLArray",
                                                @"controller":@"CLArrayController"},
                                              @{@"title":@"CLAttributedString",
                                                @"controller":@"CLAttributeStringController"},
                                              @{@"title":@"CLBundle",
                                                @"controller":@"CLBundleController"},
                                              @{@"title":@"CLData",
                                                @"controller":@"CLDataController"},
                                              @{@"title":@"CLDate",
                                                @"controller":@"CLDateController"},
                                              @{@"title":@"CLDictionary",
                                                @"controller":@"CLDictionaryController"},
                                              @{@"title":@"CLString",
                                                @"controller":@"CLStringController"},
                                              @{@"title":@"CLURL",
                                                @"controller":@"CLURLController"}]];
    
    [self.tableView reloadData];
}

- (NSMutableArray *)cl_dataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_dataSource);
    
    _cl_dataSource = [NSMutableArray array];
    
    return _cl_dataSource;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

    return self.cl_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    NSDictionary *model = self.cl_dataSource[indexPath.row];
    
    cell.textLabel.text = model[@"title"];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    NSDictionary *model = self.cl_dataSource[indexPath.row];

    UIViewController *controller = [[NSClassFromString(model[@"controller"]) alloc] init];
    
    controller.title = model[@"title"];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

@end
