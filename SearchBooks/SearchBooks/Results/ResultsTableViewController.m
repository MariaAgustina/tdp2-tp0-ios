//
//  ResultsTableViewController.m
//  SearchBooks
//
//  Created by Kaoru Heanna on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "SearchService.h"
#import "ServiceDelegate.h"
#import "BookList.h"


@interface ResultsTableViewController () <ServiceDelegate>

@property (strong, nonatomic) BookList* booklist;
@property (strong, nonatomic) SearchService *searchService;

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchService = [[SearchService alloc]initWithDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = self.searchText;
    [self searchBooks];
}

- (void)searchBooks {
    [self.searchService getBooksForText:self.searchText andPage:1];
}

- (void)serviceSuccededWithResponse:(NSDictionary*)response {
    self.booklist = [[BookList alloc]initWithDictionary:response];
    [self.tableView reloadData];
}

- (void)serviceFailedWithError:(NSError*)error {
    //TODO
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.booklist.books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell" forIndexPath:indexPath];
    
    Book *book = [self.booklist.books objectAtIndex:indexPath.row];
    NSString *labelText = book.title;
    
    [cell.textLabel setText:labelText];

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
