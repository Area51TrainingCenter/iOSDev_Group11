//
//  ListaViewController.m
//  TablasFinal
//
//  Created by Franti Saúl Huamán Mera on 4/12/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "ListaViewController.h"
#import "NuevoViewController.h"

@interface ListaViewController ()<NuevoViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *listaDeFrutasParaMostrar;
@end

@implementation ListaViewController

#pragma mark -
#pragma mark LifeCycle Methods
- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.listaDeFrutasParaMostrar = [NSMutableArray array];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"nuevoSegue"]) {
        UINavigationController *nav = segue.destinationViewController;
        NuevoViewController *y = (NuevoViewController *)nav.topViewController;
        y.delegate=self;
    }
}

#pragma mark -
#pragma mark - Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.listaDeFrutasParaMostrar count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.listaDeFrutasParaMostrar objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
    
    NSDictionary *bean =[self.listaDeFrutasParaMostrar objectAtIndex:indexPath.section];
    cell.textLabel.text = [bean objectForKey:[NSString stringWithFormat:@"e%i",indexPath.row+1]];
    
    return cell;
}

#pragma mark -
#pragma mark Nuevo View Delegate Methods
- (void)pasarNuevoRegistro:(NSDictionary *)item{
    [self.listaDeFrutasParaMostrar addObject:item];
    [self.tableView reloadData];
}
@end
