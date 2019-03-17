//
//  ViewController.m
//  SearchBooks
//
//  Created by agustina markosich on 3/16/19.
//  Copyright © 2019 agustina markosich. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultsTableViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textView;

@end


@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Búsqueda";
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     ResultsTableViewController *targetVC = (ResultsTableViewController *)segue.destinationViewController;
     targetVC.searchText = [self.textView.text copy];
 }


@end
