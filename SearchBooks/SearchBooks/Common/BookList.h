//
//  BookList.h
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//


#import "Book.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookList : NSObject

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@property (strong,nonatomic) NSArray<Book*>* books;

@end

NS_ASSUME_NONNULL_END
