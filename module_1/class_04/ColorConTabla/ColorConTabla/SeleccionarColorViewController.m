//
//  SeleccionarColorViewController.m
//  ColorConTabla
//
//  Created by Franti Saúl Huamán Mera on 4/5/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "SeleccionarColorViewController.h"

@interface SeleccionarColorViewController ()

@end

@implementation SeleccionarColorViewController

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
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorCell" forIndexPath:indexPath];
    if (indexPath.row==0) {
        cell.textLabel.text = @"Amarillo";
    }else if (indexPath.row==1){
        cell.textLabel.text = @"Rojo";
    }else{
        cell.textLabel.text = @"Azul";
    }
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        [self.delegate pasarColorSeleccionado:[UIColor yellowColor]];
    }else if (indexPath.row==1){
        [self.delegate pasarColorSeleccionado:[UIColor redColor]];
    }else{
        [self.delegate pasarColorSeleccionado:[UIColor blueColor]];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
