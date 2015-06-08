//
//  ServiceManager.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 08/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^requestCompletionBlock) (BOOL success,NSString *responseString,NSError *error);
@interface ServiceManager : NSObject

-(void)searchMoviesForKeyword:(NSString *)searchKeyWord andPageNo:(NSInteger)pageNo withComplationBlock:(requestCompletionBlock)reqCompletionBlock;

-(void)getDetailsOfMovie:(NSString *)movieId withCompletionBlock:(requestCompletionBlock)reqCompletionBlock;

-(void)getConfigurationWithCompletionBlock:(requestCompletionBlock)reqCompletionBlock;


@end
