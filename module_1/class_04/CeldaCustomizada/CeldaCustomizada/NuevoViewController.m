//
//  NuevoViewController.m
//  CeldaCustomizada
//
//  Created by Franti Saúl Huamán Mera on 4/5/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "NuevoViewController.h"

@interface NuevoViewController ()

@end

@implementation NuevoViewController

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
- (IBAction)cerrar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)guardar:(id)sender {
    NSDictionary *nuevoRegistro = [NSDictionary dictionaryWithObjectsAndKeys:
     self.cajaMarca.text, @"marca",
     self.cajaModelo.text, @"modelo",
     self.cajaColor.text, @"color",
     nil];
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate pasarNuevoRegistro:nuevoRegistro];
    }];
}
@end
