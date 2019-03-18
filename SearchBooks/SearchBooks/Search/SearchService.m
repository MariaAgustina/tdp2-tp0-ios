//
//  SearchService.m
//  SearchBooks
//
//  Created by agustina markosich on 3/17/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "SearchService.h"
#import "AFNetworking.h"

@interface SearchService ()
@property (nonatomic, weak) id <ServiceDelegate> delegate;
@end

@implementation SearchService

- (instancetype)initWithDelegate:(id <ServiceDelegate>)delegate{
    self.delegate = delegate;
    return self;
}

-(void)getBooksForText:(NSString*)text andPage:(NSInteger)page
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString* urlString = [NSString stringWithFormat:@"http://localhost:3000/books/search?query=%@&page=%ld",text,(long)page];
    
    NSString *escapedUrl = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [manager GET:escapedUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        __strong id <ServiceDelegate> strongDelegate = self.delegate;
        [strongDelegate serviceSuccededWithResponse:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        __strong id <ServiceDelegate> strongDelegate = self.delegate;
        [strongDelegate serviceFailedWithError:error];
    }];
}

@end
