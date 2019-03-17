//
//  BookServiceDelegate.h
//  SearchBooks
//
//  Created by Kaoru Heanna on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BookServiceDelegate <NSObject>

- (void)didFinishSearching;

@end

NS_ASSUME_NONNULL_END
