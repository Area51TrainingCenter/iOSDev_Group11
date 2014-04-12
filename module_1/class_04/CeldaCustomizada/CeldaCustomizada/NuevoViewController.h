//
//  NuevoViewController.h
//  CeldaCustomizada
//
//  Created by Franti Saúl Huamán Mera on 4/5/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NuevoViewControllerDelegate <NSObject>
- (void)pasarNuevoRegistro:(NSDictionary *)registro;
@end

@interface NuevoViewController : UITableViewController
@property (nonatomic, weak) id<NuevoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *cajaMarca;
@property (weak, nonatomic) IBOutlet UITextField *cajaModelo;
@property (weak, nonatomic) IBOutlet UITextField *cajaColor;
- (IBAction)cerrar:(id)sender;
- (IBAction)guardar:(id)sender;

@end
