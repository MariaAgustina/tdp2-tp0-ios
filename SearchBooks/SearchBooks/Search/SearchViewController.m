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

@end


@implementation SearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Búsqueda";
    
    self.searchService = [[SearchService alloc]initWithDelegate:self];
    [self.searchService getBooksForText:@"Hola" andPage:1];
    
    
}

- (void)serviceSuccededWithResponse:(NSDictionary*)response {
    BookList* booklist = [[BookList alloc]initWithDictionary:response];
    //TODO: push list view controller and set book list first page
    
}

- (void)serviceFailedWithError:(NSError*)error {
    //TODO
}

@end
