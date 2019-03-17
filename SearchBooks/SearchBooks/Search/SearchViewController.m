//
//  ViewController.m
//  SearchBooks
//
//  Created by agustina markosich on 3/16/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultsTableViewController.h"
#import "BookServiceDelegate.h"
#import "BookService.h"

@interface SearchViewController () <BookServiceDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textView;

@end


@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Búsqueda";
}

- (IBAction)didPressedSearchButton:(id)sender {
    BookService *bookService = [BookService sharedInstance];
    [bookService searchBooks:self.textView.text withDelegate:self];
}

- (void)showResultsScreen {
    ResultsTableViewController *vc = (ResultsTableViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"ResultsTableViewController"];
    vc.searchText = [self.textView.text copy];
    [self.navigationController showViewController:vc sender:nil];
}

 #pragma mark - BookServiceDelegate
- (void)didFinishSearching {
    BookService *bookService = [BookService sharedInstance];
    if ([[bookService getBooks] count]){
        [self showResultsScreen];
    }
}


@end
