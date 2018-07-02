//
//  EXRootController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootController.h"

@interface EXRootController ()

@property (nonatomic, strong) NSMutableArray *cl_dataSource;

@end

@implementation EXRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self.cl_dataSource addObjectsFromArray:@[@{@"title":@"EXArrayController",
                                                @"controller":@"EXArrayController"},
                                              @{@"title":@"EXAttributeStringController",
                                                @"controller":@"EXAttributeStringController"},
                                              @{@"title":@"EXBundleController",
                                                @"controller":@"EXBundleController"},
                                              @{@"title":@"EXDataController",
                                                @"controller":@"EXDataController"},
                                              @{@"title":@"EXDateController",
                                                @"controller":@"EXDateController"},
                                              @{@"title":@"EXDictionaryController",
                                                @"controller":@"EXDictionaryController"},
                                              @{@"title":@"EXStringController",
                                                @"controller":@"EXStringController"},
                                              @{@"title":@"EXURLController",
                                                @"controller":@"EXURLController"},
                                              @{@"title":@"EXTimerController",
                                                @"controller":@"EXTimerController"},
                                              @{@"title":@"EXObjectController",
                                                @"controller":@"EXObjectController"},
                                              @{@"title":@"EXNumberController",
                                                @"controller":@"EXNumberController"},
                                              @{@"title":@"EXFileManagerController",
                                                @"controller":@"EXFileManagerController"},
                                              @{@"title":@"EXLocaleController",
                                                @"controller":@"EXLocaleController"},
                                              @{@"title":@"EXSpeechController",
                                                @"controller":@"EXSpeechController"},
                                              @{@"title":@"EXNotificationCenterController",
                                                @"controller":@"EXNotificationCenterController"}]];
    
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
    
    UITableViewCell *ex_tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"EXTableViewCell"];
    
    if (!ex_tableViewCell) {
        
        ex_tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"EXTableViewCell"];
    }
    
    NSDictionary *model = self.cl_dataSource[indexPath.row];
    
    ex_tableViewCell.textLabel.text = model[@"title"];
    ex_tableViewCell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    return ex_tableViewCell;
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
