//
//  Book.m
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    self.title = [dictionary objectForKey:@"title"];
    //TODO: parse other items
    
    return self;
}

@end
