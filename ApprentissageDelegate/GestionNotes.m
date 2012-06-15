//
//  GestionNotes.m
//  ApprentissageDelegate
//
//  Created by Jérémy Lagrue on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "GestionNotes.h"

#import "GestionNotes.h"

@interface GestionNotes (PrivateMethods)
- (float) calculMoyenne;
@end

@implementation GestionNotes
@synthesize delegate = _delegate;
@synthesize studentName = _studentName;

-	(id) initWithStudentName:(NSString*)name 
{
    
    if (self = [super init])
    {
        self.studentName = name;
        _arrayDeNotes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) ajouterNoteALaMoyenne:(NSInteger)note {
    NSNumber *noteNumber = [NSNumber numberWithInteger:note];
    [_arrayDeNotes addObject:noteNumber];
    float moyenne = [self calculMoyenne];
    
    if (moyenne < 10.0) {
        [_delegate gestionNotes:self enDessousMoyenne:moyenne];
    }
    
    if ([_delegate respondsToSelector:@selector(gestionNotes:aRecuUneNote:nouvelleMoyenne:)]) 
    { 
        [_delegate gestionNotes:self aRecuUneNote:note nouvelleMoyenne:moyenne];
    }
}
@end

@implementation GestionNotes (PrivateMethods)
-	(float) calculMoyenne 
{
    NSInteger cumulNotes = 0;
    for (NSNumber *number in _arrayDeNotes)
    {
        NSInteger integerValue = [number integerValue];
        cumulNotes += integerValue; 
    }    
    return (float)cumulNotes/(float)[_arrayDeNotes count];   
}
@end

