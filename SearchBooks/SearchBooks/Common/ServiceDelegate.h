//
//  ServiceDelegate.h
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ServiceDelegate <NSObject>

- (void)serviceSuccededWithResponse:(NSDictionary*)response;
- (void)serviceFailedWithError:(NSError*)error;

@end

NS_ASSUME_NONNULL_END
