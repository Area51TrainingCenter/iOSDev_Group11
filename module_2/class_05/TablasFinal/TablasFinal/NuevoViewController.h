//
//  NuevoViewController.h
//  TablasFinal
//
//  Created by Franti Saúl Huamán Mera on 4/12/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NuevoViewControllerDelegate <NSObject>
- (void)pasarNuevoRegistro:(NSDictionary *)item;
@end

@interface NuevoViewController : UITableViewController
@property (nonatomic, weak) id<NuevoViewControllerDelegate> delegate;
- (IBAction)cerrarBoton:(id)sender;
- (IBAction)guardarBoton:(id)sender;

@end
