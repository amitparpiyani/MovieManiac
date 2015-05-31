//
//  ServiceManager.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 08/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//




#import "ServiceManager.h"
#import "AppDelegate.h"
#define BASE_URL @"http://api.themoviedb.org/3/"
#define API_KEY  @"1a949e2b4ca7d68e78ee4c9c8eb8e6fc"
#define SEARCHMOVIE_URL @"search/movie?"

//#define MOVIEDETAILS_URL @"/movie/%@?"
typedef void (^requestCompletionBlock) (BOOL success,NSString *responseString,NSError *error);

@interface ServiceManager ()
{
    NSURLConnection *urlConnection;
    
}

@end
@implementation ServiceManager
//+(ServiceManager *)getInstance
//{
//    static ServiceManager *serviceManager=nil;
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^
//                  {
//                      serviceManager = [[self alloc] init];
//                      
//                  });
//    return serviceManager;
//}
-(void)getInTheatersMovies
{
    
   // NSURL *inTheatersUrl = [[NSURL alloc] initWithString:@""];
    //NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
}
-(void)searchMoviesForKeyword:(NSString *)searchKeyWord andPageNo:(NSString*)pageNo withComplationBlock:(requestCompletionBlock)reqCompletionBlock
{
    NSString *searchUrlStr = [NSString stringWithFormat:@"%@%@query=%@&api_key=%@&page=%@",BASE_URL,SEARCHMOVIE_URL,searchKeyWord,API_KEY,pageNo];
    NSLog(@"Search Url: %@",searchUrlStr);
    NSURL* url = [[NSURL alloc] initWithString:searchUrlStr];
    NSURLRequest *searchRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.0];
    [NSURLConnection sendAsynchronousRequest:searchRequest queue:[AppDelegate connectionQueue]completionHandler:^(NSURLResponse *response,NSData *data,NSError *error)
     {
         if (error || !response || !data)
         {
             reqCompletionBlock(NO,nil,error);
         }
         else
         {
             NSString *responseStr= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             reqCompletionBlock(NO,responseStr,nil);
         }
         
     }
     ];
    
}
-(void)getDetailsOfMovie:(NSString *)movieId withCompletionBlock:(requestCompletionBlock)reqCompletionBlock
{
    NSString *searchUrlStr = [NSString stringWithFormat:@"%@movie/%@?api_key=%@",BASE_URL,movieId,API_KEY];
    NSURL* url = [[NSURL alloc] initWithString:searchUrlStr];
    NSURLRequest *searchRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.0];
    [NSURLConnection sendAsynchronousRequest:searchRequest queue:[AppDelegate connectionQueue]completionHandler:^(NSURLResponse *response,NSData *data,NSError *error)
     {
         if (error || !response || !data)
         {
             reqCompletionBlock(NO,nil,error);
         }
         else
         {
             reqCompletionBlock(NO,[NSString stringWithUTF8String:[data bytes]],nil);
         }
         
     }
     ];
}

-(void)getConfigurationWithCompletionBlock:(requestCompletionBlock)reqCompletionBlock
{
    NSString *configUrlStr = [NSString stringWithFormat:@"%@configuration?api_key=%@",BASE_URL,API_KEY];
    NSURL* url = [[NSURL alloc] initWithString:configUrlStr];
    NSURLRequest *searchRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.0];
    [NSURLConnection sendAsynchronousRequest:searchRequest queue:[AppDelegate connectionQueue]completionHandler:^(NSURLResponse *response,NSData *data,NSError *error)
     {
         if (error || !response || !data)
         {
             reqCompletionBlock(NO,nil,error);
         }
         else
         {
             reqCompletionBlock(NO,[NSString stringWithUTF8String:[data bytes]],nil);
         }
         
     }
     ];
}
#pragma -mark NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@",[response description]);
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}
@end
