//
//  Book.h
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *category;
@property (copy, nonatomic) NSString *tag;
//TODO: image

@end

NS_ASSUME_NONNULL_END
