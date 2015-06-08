//
//  RottenTomatosController.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 07/06/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "RottenTomatosController.h"
#import "ServiceManager.h"
#import "Movies.h"
#import <JSONModel/JSONModel.h>

@interface RottenTomatosController ()
{
    NSMutableArray *movieList;
    Movies *searchMoviesResult;
    BOOL bDataFetchInProgress;
    NSString *keyWordsearched;


}

@end

@implementation RottenTomatosController
@synthesize delegate;
+ (RottenTomatosController *)getSharedInstance
{
    static RottenTomatosController *rottenTomatosController;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        rottenTomatosController = [[RottenTomatosController alloc] init];
    });
    return rottenTomatosController;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        movieList = [[NSMutableArray alloc] init];
        keyWordsearched=@"";
        
        
    }
    return self;
}


-(NSArray *)getMoviesList
{
    return movieList;
    
}

-(void)fetchNextPageResults
{
    [self searchMoviesWithKeyword:keyWordsearched andPageNo:searchMoviesResult.currentPage+1];
    
}
- (void)searchMoviesWithKeyword:(NSString *)keyWord andPageNo:(NSInteger)pageNo
{
    bDataFetchInProgress = YES;
    if (keyWord!=keyWordsearched) {
        [movieList removeAllObjects];
        keyWordsearched = keyWord;

        
    }
    ServiceManager *serviceManager = [[ServiceManager alloc] init];
    [serviceManager searchMoviesForKeyword:keyWord andPageNo:pageNo withComplationBlock:^(BOOL success,NSString *responseString,NSError *error)
     {
         if (error) {
             NSLog(@"%@",[error description]);
         }
         else
         {
             JSONModelError *jsonError;
             searchMoviesResult = [[Movies alloc] initWithString:responseString error:&jsonError];
             [movieList addObjectsFromArray:searchMoviesResult.moviesArray];
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 bDataFetchInProgress = NO;
                 [delegate dataUpdatesAvailable];
                 
                 
             });
             
         }
     }
     ];
}

- (BOOL)iSFetchInProgress
{
    return bDataFetchInProgress;
}

-(NSInteger)getTotalMoviesAvailable
{
    return searchMoviesResult.totalResults;
}
@end
