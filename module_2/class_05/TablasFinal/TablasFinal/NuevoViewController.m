//
//  NuevoViewController.m
//  TablasFinal
//
//  Created by Franti Saúl Huamán Mera on 4/12/14.
//  Copyright (c) 2014 Franti Saúl Huamán Mera. All rights reserved.
//

#import "NuevoViewController.h"
#import "FormularioCell.h"
#import "DecidirCell.h"

@interface NuevoViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *txtNombre;
@property (nonatomic, strong) UITextField *txtPrecio;
@property (nonatomic, strong) UITextField *txtCiudad;

@property (nonatomic, strong) UITextField *txtColor;
@property (nonatomic, strong) UITextField *txtPeso;
@property (nonatomic, strong) UISwitch *currentS;

@property (nonatomic, assign) NSInteger numeroSecciones;
@end

@implementation NuevoViewController

#pragma mark -
#pragma mark LifeCycle Methods
- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.numeroSecciones = 2;
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
    return self.numeroSecciones;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else if (section==1){
        return 1;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        FormularioCell *s1 = [tableView dequeueReusableCellWithIdentifier:@"prototipo1" forIndexPath:indexPath];
        if (indexPath.row==0) {
            s1.nombre.text = @"Nombre";
            s1.valor.placeholder = @"Area51";
            self.txtNombre = s1.valor;
        }else if (indexPath.row==1){
            s1.nombre.text = @"Precio";
            s1.valor.placeholder = @"En soles";
            self.txtPrecio = s1.valor;
        }else{
            s1.nombre.text = @"Ciudad";
            s1.valor.placeholder = @"Lima";
            self.txtCiudad = s1.valor;
        }
        return s1;
    }else if (indexPath.section==1){
        DecidirCell *s2 = [tableView dequeueReusableCellWithIdentifier:@"prototipo2" forIndexPath:indexPath];
        [s2.esPeruano addTarget:self action:@selector(cambiarValorDelSwitch:) forControlEvents:UIControlEventValueChanged];
        self.currentS = s2.esPeruano;
        return s2;
    }else{
        FormularioCell *s3 = [tableView dequeueReusableCellWithIdentifier:@"prototipo1" forIndexPath:indexPath];
        if (indexPath.row==0) {
            s3.nombre.text = @"Color";
            s3.valor.placeholder = @"Lima";
            self.txtColor = s3.valor;
        }else{
            s3.nombre.text = @"Peso";
            s3.valor.placeholder = @"Lima";
            self.txtPeso = s3.valor;
        }
        return s3;
    }
}

- (IBAction)cambiarValorDelSwitch:(id)sender{
    UISwitch *t = (UISwitch *)sender;
    if (t.on) {
        self.numeroSecciones=3;
        [self.tableView insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    }else{
        self.numeroSecciones=2;
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationLeft];
    }
    NSLog(@"Switch en acción");
}

#pragma mark -
#pragma mark IBAction Methods
- (IBAction)cerrarBoton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)guardarBoton:(id)sender {
    
    NSMutableDictionary *nuevo = [NSMutableDictionary new];
    [nuevo setValue:self.txtNombre.text forKey:@"e1"];
    [nuevo setValue:self.txtPrecio.text forKey:@"e2"];
    [nuevo setValue:self.txtCiudad.text forKey:@"e3"];
    
    if (self.currentS.on) {
        [nuevo setValue:self.txtColor.text forKey:@"e4"];
        [nuevo setValue:self.txtPeso.text forKey:@"e5"];
    }
    NSLog(@"%@",nuevo);
    [self.delegate pasarNuevoRegistro:nuevo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark TextField Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSLog(@"Delegado");
    return YES;
}
@end
