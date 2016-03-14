//
//  StudentSessionsTableViewController.h
//  asi
//
//  Created by Eric Aguiar on 11/21/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class API;

@interface StudentSessionsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>



@property (weak, nonatomic) IBOutlet UISearchBar *studentSessionsSearchBar;
@property (strong, nonatomic) IBOutlet UITableView *studentSessionsTableView;

@property (nonatomic, strong) NSMutableArray * initialCities;
@property (nonatomic, strong) NSMutableArray * filterdCities;
@property BOOL isFiltered;

//model
@property (strong, nonatomic) API *api;


@end
