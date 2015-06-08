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
#import "MovieInformationCell.h"
#import "RottenTomatosController.h"
#import "MoviesTableViewDataSource.h"
#import "Constants.h"

@interface FirstViewController ()<UISearchBarDelegate,RottenTomatosDelegate>
{
    PreloaderViewController *preLoaderViewController;
    Movies *searchMoviesResult;
    NSMutableArray *movieList;
    NSString *searchKeyword;
    MoviesTableViewDataSource *moviesTableViewDatasource;


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
    [[self.searchImgBtn imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [self.searchImgBtn setImage:[UIImage imageNamed:@"searchIcon.png"] forState:UIControlStateNormal];
    self.searchBar.delegate = self;
    moviesTableViewDatasource = [[MoviesTableViewDataSource alloc] init];
    self.moviesTableView.delegate = moviesTableViewDatasource;
    self.moviesTableView.dataSource = moviesTableViewDatasource;
    movieList = [[NSMutableArray alloc] init];
    UINib *movieTableViewCell = [UINib nibWithNibName:@"MovieInformationCell" bundle:[NSBundle mainBundle]];
    [self.moviesTableView registerNib:movieTableViewCell forCellReuseIdentifier:CELL_REUSE_IDENTIFIER];
    self.moviesTableView.estimatedRowHeight = 280.0f;
    self.moviesTableView.rowHeight = UITableViewAutomaticDimension;
    [RottenTomatosController getSharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    //self.moviesTableView.estimatedRowHeight = 260.0f;
    //self.moviesTableView.rowHeight = UITableViewAutomaticDimension;
    [self.moviesTableView reloadData];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.moviesTableView reloadData];
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






#pragma -mark searchbar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self addPreLoaderViewViewController];
    [movieList removeAllObjects];
    searchMoviesResult = nil;
    searchKeyword=searchBar.text;
    [[RottenTomatosController getSharedInstance] searchMoviesWithKeyword:searchKeyword andPageNo:1];
}




# pragma Rotten tomotos delegate
- (void)dataUpdatesAvailable
{
    if (preLoaderViewController) {
        [self removePreLoaderViewController];
    }
    [self.moviesTableView layoutSubviews];
    self.moviesTableView.hidden = NO;
    [self.moviesTableView reloadData];
}
@end
