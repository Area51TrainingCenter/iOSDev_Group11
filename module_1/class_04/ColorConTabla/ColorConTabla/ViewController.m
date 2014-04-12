//
//  ViewController.m
//  ColorConTabla
//
//  Created by Franti Saúl Huamán Mera on 4/5/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "ViewController.h"
#import "SeleccionarColorViewController.h"

@interface ViewController ()<SeleccionarColorViewControllerDelegate>

@end

@implementation ViewController

#pragma mark -
#pragma mark LifeCycle Methods
- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SeleccionarColorViewController *t = segue.destinationViewController;
    t.delegate=self;
}

#pragma mark -
#pragma mark Seleccionar Color View Delegate Method
- (void)pasarColorSeleccionado:(UIColor *)color{
    self.view.backgroundColor = color;
}

@end
