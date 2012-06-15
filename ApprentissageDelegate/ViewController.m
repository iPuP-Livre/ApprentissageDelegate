//
//  ViewController.m
//  ApprentissageDelegate
//
//  Created by Jérémy Lagrue on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-	(void)viewDidLoad 
{
    // Label affichant la moyenne
    _labelNote = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 200, 30)];
    _labelNote.backgroundColor = [UIColor clearColor];
    _labelNote.text = @"pas de notes";
    [self.view addSubview:_labelNote];
    
    // bouton pour permettre de valider l'entrée de la note
    _boutonValider = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _boutonValider.frame = CGRectMake(20, 70, 80, 30);
    [_boutonValider addTarget:self action:@selector(validerSaisieNote:) forControlEvents:UIControlEventTouchUpInside];
    [_boutonValider setTitle:@"Ajouter" forState:UIControlStateNormal];
    [self.view addSubview:_boutonValider];
    
    // textField permettant de saisir la note
    _textFieldNote = [[UITextField alloc] initWithFrame:CGRectMake(20, 110, 200, 30)];
    _textFieldNote.keyboardType = UIKeyboardTypeNumberPad;
    _textFieldNote.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldNote.clearsOnBeginEditing = YES;
    
    [self.view addSubview:_textFieldNote];
    
    _gestionnaire = [[GestionNotes alloc] initWithStudentName:@"Thierry"];
    _gestionnaire.delegate = self;
    
    [super viewDidLoad];
}

-	(void)validerSaisieNote:(id)sender 
{
    NSInteger note = [_textFieldNote.text integerValue];    
    if (note <= 20) 
    {
        [_gestionnaire ajouterNoteALaMoyenne:note];
        [_textFieldNote resignFirstResponder];
    }
    else 
    {
        _textFieldNote.text = @"";
    }
}

#pragma mark -
#pragma mark GestionNotes delegate methods

-	(void)gestionNotes:(GestionNotes*)gestionNotes aRecuUneNote:(NSInteger)note nouvelleMoyenne:(float)moyenne
{
    [_labelNote setText:[NSString stringWithFormat:@"moyenne : %f", moyenne]];
}

-	(void)gestionNotes:(GestionNotes*)gestionNotes enDessousMoyenne:(float)moyenne 
{
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"Attention"
                                                     message:[NSString stringWithFormat:@"Votre moyenne de %f n'est pas bonne !", moyenne] 
                                                                               delegate:self 
                                                                      cancelButtonTitle:@"Ok" 
                                                                      otherButtonTitles:nil];
                           
                        [alertV show];
}
                           
@end
