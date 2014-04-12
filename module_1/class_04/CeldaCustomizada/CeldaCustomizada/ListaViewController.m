//
//  ListaViewController.m
//  CeldaCustomizada
//
//  Created by Franti Saúl Huamán Mera on 4/5/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "ListaViewController.h"
#import "NuevoViewController.h"
#import "RegistroCell.h"

@interface ListaViewController ()<NuevoViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *listaDeAutos;
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
    self.listaDeAutos = [NSMutableArray array];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nav = segue.destinationViewController;
    NuevoViewController *detail = (NuevoViewController *)nav.topViewController;
    detail.delegate=self;
    /*
    ((NuevoViewController *)nav.topViewController).delegate = self;*/
}

#pragma mark -
#pragma mark - Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listaDeAutos count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Seccion:%i, Marca:%i",indexPath.section, indexPath.row);
    
    NSDictionary *item = [self.listaDeAutos objectAtIndex:indexPath.row];
    
    RegistroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"autoCell" forIndexPath:indexPath];
    cell.modelo.text = [item objectForKey:@"modelo"],
    cell.marca.text = [item objectForKey:@"marca"];
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}

#pragma mark -
#pragma mark Nuevo View Delegate Method
- (void)pasarNuevoRegistro:(NSDictionary *)registro{
    [self.listaDeAutos addObject:registro];
    NSLog(@"Array: %@",self.listaDeAutos);
    [self.tableView reloadData];
}
@end
