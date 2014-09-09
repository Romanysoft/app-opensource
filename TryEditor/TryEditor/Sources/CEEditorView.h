

@import Cocoa;
#import "CEEditorWrapper.h"
#import "CENavigationBarController.h"
#import "CETextView.h"
#import "CESyntaxParser.h"


@class CEEditorWrapper;


@interface CEEditorView : NSView <NSTextViewDelegate>

@property (nonatomic, weak) CEEditorWrapper *editorWrapper;

// readonly
@property (readonly, nonatomic) CETextView *textView;
@property (readonly, nonatomic) CENavigationBarController *navigationBar;
@property (readonly, nonatomic) CESyntaxParser *syntaxParser;


// Public method
- (NSString *)string;
- (void)replaceTextStorage:(NSTextStorage *)textStorage;
- (void)setShowsLineNum:(BOOL)showsLineNum;
- (void)setShowsNavigationBar:(BOOL)showsNavigationBar;
- (void)setWrapsLines:(BOOL)wrapsLines;
- (void)setShowsInvisibles:(BOOL)showsInvisibles;
- (void)setUsesAntialias:(BOOL)usesAntialias;
- (void)updateCloseSplitViewButton:(BOOL)isEnabled;
- (void)setCaretToBeginning;
- (void)setSyntaxWithName:(NSString *)styleName;
- (void)recolorAllTextViewString;
- (void)updateOutlineMenu;
- (void)updateOutlineMenuSelection;
- (void)stopUpdateLineNumberTimer;
- (void)stopUpdateOutlineMenuTimer;
- (NSCharacterSet *)firstCompletionCharacterSet;
- (void)setBackgroundColorAlpha:(CGFloat)alpha;

@end
