//
//  FirstViewController.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 08/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "FirstViewController.h"
#import "ServiceManager.h"
#import "Movies.h"
#import "Configuration.h"
#import "PreloaderViewController.h"
#import "MovieTableViewCell.h"
#define REUSE_IDENTIFIER @"MovieCellIdentifier"

@interface FirstViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
{
    PreloaderViewController *preLoaderViewController;
    Movies *searchMoviesResult;
    NSMutableArray *movieList;
    NSString *searchKeyword;


}
@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *searchImgBtn;

- (IBAction)showSearchBar:(id)sender;

@end

@implementation FirstViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UIImage *searchImgIcon = [UIImage imageNamed:@"searchIcon.png"];
    [[self.searchImgBtn imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [self.searchImgBtn setImage:[UIImage imageNamed:@"searchIcon.png"] forState:UIControlStateNormal];
    self.searchBar.delegate = self;
    self.moviesTableView.delegate = self;
    self.moviesTableView.dataSource = self;
    movieList = [[NSMutableArray alloc] init];
    UINib *movieTableViewCell = [UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]];
    [self.moviesTableView registerNib:movieTableViewCell forCellReuseIdentifier:REUSE_IDENTIFIER];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showSearchBar:(id)sender
{
    self.searchBar.hidden = NO;
    self.searchImgBtn.hidden = YES;
}
-(void)addPreLoaderViewViewController
{
    preLoaderViewController = [[PreloaderViewController alloc] initWithNibName:@"PreloaderViewController" bundle:nil];
    preLoaderViewController.view.frame = self.view.frame;
    [preLoaderViewController.activityIndicator startAnimating];
    preLoaderViewController.msgLabel.text=NSLocalizedString(@"searching", @"searching Lbl");
    [self addChildViewController:preLoaderViewController];
    [self.view addSubview:preLoaderViewController.view];
    [preLoaderViewController didMoveToParentViewController:self];
}

-(void)removePreLoaderViewController
{
    [preLoaderViewController.view removeFromSuperview];
    [preLoaderViewController willMoveToParentViewController:nil];
    [preLoaderViewController removeFromParentViewController];
    preLoaderViewController = nil;
}

-(void)searchMoviesWithKeyWord:(NSString *)keyword withPageNo:(NSString *)pageNo
{
    ServiceManager *serviceManager = [[ServiceManager alloc] init];
    [serviceManager searchMoviesForKeyword:keyword andPageNo:pageNo withComplationBlock:^(BOOL success,NSString *responseString,NSError *error)
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
                 [self removePreLoaderViewController];
                 self.moviesTableView.hidden = NO;
                 [self.moviesTableView reloadData];


             });
             
         }
     }
     ];
}

-(void)loadNewDataIfRequired:(NSInteger)currentRow
{
    if (currentRow > [movieList count]-2 && currentRow < searchMoviesResult.totalResults)
    {
        [self searchMoviesWithKeyWord:searchKeyword withPageNo:[NSString stringWithFormat:@"%ld",(long)searchMoviesResult.currentPage+1]];
    }
}


#pragma -mark searchbar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self addPreLoaderViewViewController];
    [movieList removeAllObjects];
    searchMoviesResult = nil;
    searchKeyword=searchBar.text;
    [self searchMoviesWithKeyWord:searchBar.text withPageNo:@"1"];
}

#pragma -mark tableviewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [movieList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = REUSE_IDENTIFIER;
    [self loadNewDataIfRequired:indexPath.row];
    Movie *movie = [movieList objectAtIndex:indexPath.row];
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil)
    {
        cell = [[MovieTableViewCell alloc] init];
    
    }
    [cell updateCellWithMovieObject:movie];
    if (movie.backdropPath!=nil)
    {
        [cell updateMovieThumbnail:movie.backdropPath];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 128.0f;
}
@end
