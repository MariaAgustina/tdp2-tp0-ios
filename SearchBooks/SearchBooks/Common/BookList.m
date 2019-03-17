//
//  BookList.m
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "BookList.h"

@implementation BookList

- (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    
    NSMutableArray *mutableBooks = [[NSMutableArray alloc]init];
    NSArray* booksArray = [dictionary objectForKey:@"result"];
    for(NSDictionary* bookDictionary in booksArray){
        Book* book = [[Book alloc] initWithDictionary:bookDictionary];
        [mutableBooks addObject:book];
    }
    self.books = [mutableBooks copy];
    
    return self;
}

@end
