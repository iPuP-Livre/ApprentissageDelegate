//
//  ViewController.h
//  ApprentissageDelegate
//
//  Created by Jérémy Lagrue on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestionNotes.h" 

@interface ViewController : UIViewController <GestionNotesDelegate>
{
    UILabel *_labelNote;
    UIButton *_boutonValider;
    UITextField *_textFieldNote;
    GestionNotes *_gestionnaire; 
}

@end
