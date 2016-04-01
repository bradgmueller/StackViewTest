//
//  ViewController.m
//  StackViewTest
//
//  Created by Bradley Mueller on 4/1/16.
//  Copyright © 2016 Cellaflora. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray *tableData;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupView];
    
    [self loadData];
}

#pragma mark - Setup view

- (void)setupView
{
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.estimatedRowHeight = 50.0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
}

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

#pragma mark - Data

- (void)loadData
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 20; i++)
    {
        RowObject *row = [[RowObject alloc] init];
        row.indent = i % 2 == 1;
        row.showSeparator = i % 3 == 0;
        row.showButton1 = i % 4 == 0;
        row.showButton2 = i % 5 == 0;
        row.showInfoButton = i % 6 == 0;
        row.title = [NSString stringWithFormat:@"Title %ld", i];
        
        [array addObject:row];
    }
    
    self.tableData = [NSArray arrayWithArray:array];
    
    [self.tableView reloadData];
}

#pragma mark - UITableView

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell;
    NSString *CellIdentifier = NSStringFromClass([TableViewCell class]);
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.rowObject = self.tableData[indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
