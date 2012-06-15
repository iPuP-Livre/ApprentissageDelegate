//
//  GestionNotes.h
//  ApprentissageDelegate
//
//  Created by Jérémy Lagrue on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GestionNotesDelegate;

@interface GestionNotes : NSObject{
    NSMutableArray *_arrayDeNotes;
}

@property (nonatomic, assign) id <GestionNotesDelegate> delegate;
@property (nonatomic, copy) NSString *studentName;

- (id) initWithStudentName:(NSString*)name;
- (void) ajouterNoteALaMoyenne:(NSInteger)note;

@end

@protocol GestionNotesDelegate <NSObject>
@required
- (void) gestionNotes:(GestionNotes*)gestionNotes aRecuUneNote:(NSInteger)note nouvelleMoyenne:(float)moyenne;
@optional
- (void) gestionNotes:(GestionNotes*)gestionNotes enDessousMoyenne:(float)moyenne;
@end
