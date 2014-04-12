//
//  SeleccionarColorViewController.h
//  ColorConTabla
//
//  Created by Franti Saúl Huamán Mera on 4/5/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeleccionarColorViewControllerDelegate <NSObject>
- (void)pasarColorSeleccionado:(UIColor *)color;
@end

@interface SeleccionarColorViewController : UITableViewController
@property (nonatomic, weak) id<SeleccionarColorViewControllerDelegate> delegate;
@end
