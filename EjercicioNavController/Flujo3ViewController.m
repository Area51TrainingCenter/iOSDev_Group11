//
//  Flujo3ViewController.m
//  EjercicioNavController
//
//  Created by Franti Saúl Huamán Mera on 3/15/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "Flujo3ViewController.h"

@interface Flujo3ViewController ()

@end

@implementation Flujo3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cerrarButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
