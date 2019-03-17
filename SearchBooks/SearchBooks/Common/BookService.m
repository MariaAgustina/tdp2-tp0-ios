//
//  BookService.m
//  SearchBooks
//
//  Created by Kaoru Heanna on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "BookService.h"
#import "SearchService.h"
#import "ServiceDelegate.h"
#import "BookList.h"

@interface BookService () <ServiceDelegate>

@property (strong, nonatomic) BookList* booklist;
@property (strong, nonatomic) SearchService *searchService;
@property (nonatomic, weak) id <BookServiceDelegate> delegate;

@end

@implementation BookService

+ (instancetype)sharedInstance {
    static BookService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BookService alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    self.searchService = [[SearchService alloc]initWithDelegate:self];
    return self;
}

- (NSArray<Book*>*)getBooks {
    if (self.booklist == nil){
        return [[NSArray alloc] init];
    }
    return [self.booklist.books copy];
}

- (void)searchBooks:(NSString*)searchText withDelegate:(id <BookServiceDelegate>)delegate {
    self.delegate = delegate;
    [self.searchService getBooksForText:searchText andPage:1];
}

- (void)serviceSuccededWithResponse:(NSDictionary*)response {
    self.booklist = [[BookList alloc]initWithDictionary:response];
    [self.delegate didFinishSearching];
    self.delegate = nil;
}

- (void)serviceFailedWithError:(NSError*)error {
    //TODO
}

@end
