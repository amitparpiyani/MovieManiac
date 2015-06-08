//
//  MoviesTableViewDataSource.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 08/06/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "MoviesTableViewDataSource.h"
#import "RottenTomatosController.h"
#import "Movie.h"
#import "Constants.h"
#import "MovieInformationCell.h"
@interface MoviesTableViewDataSource ()
{
    NSArray *moviesList;
}

@end

@implementation MoviesTableViewDataSource

-(void)loadNewDataIfRequired:(NSInteger)currentRow
{
    if (currentRow > [moviesList count]-4 && currentRow < [[RottenTomatosController getSharedInstance] getTotalMoviesAvailable] && ![[RottenTomatosController getSharedInstance] iSFetchInProgress])
    {
        [[RottenTomatosController getSharedInstance] fetchNextPageResults];
    }
}
#pragma mark Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    moviesList = [[RottenTomatosController getSharedInstance]getMoviesList];
    return [moviesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = CELL_REUSE_IDENTIFIER;
    [self loadNewDataIfRequired:indexPath.row];
    Movie *movie = [moviesList objectAtIndex:indexPath.row];
    MovieInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil)
    {
        cell = [[MovieInformationCell alloc] init];
        
    }
    [cell updateCellWithMovieInformation:movie];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 330.0f;
}

@end
