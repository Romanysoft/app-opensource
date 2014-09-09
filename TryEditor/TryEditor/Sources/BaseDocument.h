

@import Cocoa;
#import "CEWindowController.h"
#import "CETextSelection.h"
#import "CEEditorWrapper.h"
#import "constants.h"


@class CEEditorWrapper;
@class CEWindowController;


typedef NS_ENUM(NSUInteger, CEGoToType) {
    CEGoToLine,
    CEGoToCharacter
};


@interface BaseDocument : NSDocument

@property (nonatomic) CEEditorWrapper *editor;

// readonly properties
@property (readonly, nonatomic) CEWindowController *windowController;
@property (readonly, nonatomic) CETextSelection *selection;
@property (readonly, nonatomic) NSStringEncoding encoding;
@property (readonly, nonatomic) OgreNewlineCharacter lineEnding;
@property (readonly, nonatomic, copy) NSDictionary *fileAttributes;
@property (readonly, nonatomic, getter=isWritable) BOOL writable;


- (NSString *)stringForSave;

- (void)setStringToEditor;

- (NSString *)currentIANACharSetName;
- (NSArray *)findCharsIncompatibleWithEncoding:(NSStringEncoding)encoding;
- (BOOL)readStringFromData:(NSData *)data encoding:(NSStringEncoding)encoding xattr:(BOOL)checksXattr;
- (BOOL)doSetEncoding:(NSStringEncoding)encoding updateDocument:(BOOL)updateDocument
             askLossy:(BOOL)askLossy lossy:(BOOL)lossy asActionName:(NSString *)actionName;

- (NSString *)lineEndingString;
- (NSString *)lineEndingName;
- (void)doSetLineEnding:(CELineEnding)lineEnding;

- (void)doSetSyntaxStyle:(NSString *)name;

- (NSRange)rangeInTextViewWithLocation:(NSInteger)location length:(NSInteger)length;
- (void)setSelectedCharacterRangeInTextViewWithLocation:(NSInteger)location length:(NSInteger)length;
- (void)setSelectedLineRangeInTextViewWithLocation:(NSInteger)location length:(NSInteger)length;
- (void)gotoLocation:(NSInteger)location length:(NSInteger)length type:(CEGoToType)type;


- (IBAction)changeLineEndingToLF:(id)sender;
- (IBAction)changeLineEndingToCR:(id)sender;
- (IBAction)changeLineEndingToCRLF:(id)sender;
- (IBAction)changeLineEnding:(id)sender;
- (IBAction)changeEncoding:(id)sender;
- (IBAction)changeTheme:(id)sender;
- (IBAction)changeSyntaxStyle:(id)sender;
- (IBAction)insertIANACharSetName:(id)sender;
- (IBAction)insertIANACharSetNameWithCharset:(id)sender;
- (IBAction)insertIANACharSetNameWithEncoding:(id)sender;

@end
