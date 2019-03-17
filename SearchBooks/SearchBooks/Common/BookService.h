//
//  BookService.h
//  SearchBooks
//
//  Created by Kaoru Heanna on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookServiceDelegate.h"
#import "Book.h"

@interface BookService : NSObject

+ (instancetype)sharedInstance;

- (void)searchBooks:(NSString*)searchText withDelegate:(id <BookServiceDelegate>)delegate;

- (NSArray<Book*>*)getBooks;
    
@end
