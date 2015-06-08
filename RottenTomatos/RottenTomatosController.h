//
//  RottenTomatosController.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 07/06/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RottenTomatosDelegate

-(void)dataUpdatesAvailable;
@end

@interface RottenTomatosController : NSObject
@property(nonatomic,weak)id<RottenTomatosDelegate> delegate;
+(RottenTomatosController *)getSharedInstance;
-(void)searchMoviesWithKeyword:(NSString *)keyWord andPageNo:(NSInteger)pageNo;
-(NSArray *)getMoviesList;
- (BOOL)iSFetchInProgress;
-(NSInteger)getTotalMoviesAvailable;
-(void)fetchNextPageResults;
@end
