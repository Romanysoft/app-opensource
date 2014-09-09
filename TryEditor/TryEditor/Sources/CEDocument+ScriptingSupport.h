

@import Cocoa;
#import "BaseDocument.h"


@interface BaseDocument (ScriptingSupport) <NSTextStorageDelegate>

// AppleScript Enum
typedef NS_ENUM(NSUInteger, CEOSALineEnding) {
    CEOSALineEndingLF = 'leLF',
    CEOSALineEndingCR = 'leCR',
    CEOSALineEndingCRLF = 'leCL'
};

// Public method
- (void)cleanUpTextStorage:(NSTextStorage *)inTextStorage;

// AppleScript accessor
- (NSTextStorage *)textStorage;
- (void)setTextStorage:(id)object;
- (NSTextStorage *)contents;
- (void)setContents:(id)object;
- (NSNumber *)length;
- (CEOSALineEnding)lineEndingChar;
- (void)setLineEndingChar:(CEOSALineEnding)lineEndingChar;
- (NSString *)encodingName;
- (NSString *)IANACharSetName;
- (NSString *)coloringStyle;
- (void)setColoringStyle:(NSString *)styleName;
- (CETextSelection *)selectionObject;
- (void)setSelectionObject:(id)object;
- (NSNumber *)wrapsLines;
- (void)setWrapsLines:(NSNumber *)wrapsLines;
- (NSNumber *)lineSpacing;
- (void)setLineSpacing:(NSNumber *)lineSpacing;

@end
