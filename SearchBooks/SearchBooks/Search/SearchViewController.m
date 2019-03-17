//
//  ViewController.m
//  SearchBooks
//
//  Created by agustina markosich on 3/16/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchService.h"
#import "ServiceDelegate.h"
#import "BookList.h"

@interface SearchViewController () <ServiceDelegate>

@property (strong, nonatomic) SearchService *searchService;
@property (weak, nonatomic) IBOutlet UITextField *textView;

@end


@implementation SearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Búsqueda";
    
    self.searchService = [[SearchService alloc]initWithDelegate:self];
    
}

- (void)serviceSuccededWithResponse:(NSDictionary*)response {
    BookList* booklist = [[BookList alloc]initWithDictionary:response];
    //TODO: push list view controller and set book list first page
    
}

- (void)serviceFailedWithError:(NSError*)error {
    //TODO
}

- (IBAction)searchButtonPressed:(id)sender {
    [self.searchService getBooksForText:self.textView.text andPage:1];
}

@end
