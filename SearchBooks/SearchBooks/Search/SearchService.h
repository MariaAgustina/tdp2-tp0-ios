//
//  SearchService.h
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchService : NSObject

- (instancetype)initWithDelegate:(id <ServiceDelegate>)delegate;
- (void)getBooksForText:(NSString*)text andPage:(NSInteger)page;

@end

NS_ASSUME_NONNULL_END
