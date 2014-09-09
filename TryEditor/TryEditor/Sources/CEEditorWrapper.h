
@import Cocoa;
#import "CEEditorView.h"
#import "CETextView.h"
#import "CEWindowController.h"


@class BaseDocument;
@class CEWindowController;


@interface CEEditorWrapper : NSResponder

@property (nonatomic) BOOL showsLineNum;
@property (nonatomic) BOOL showsNavigationBar;
@property (nonatomic) BOOL wrapsLines;
@property (nonatomic) BOOL showsPageGuide;
@property (nonatomic) BOOL showsInvisibles;
@property (nonatomic, getter=isVerticalLayoutOrientation) BOOL verticalLayoutOrientation;
@property (nonatomic) CETextView *textView;

@property (readonly, nonatomic) BOOL canActivateShowInvisibles;


// Public method
- (BaseDocument *)document;
- (CEWindowController *)windowController;
- (NSTextStorage *)textStorage;

- (NSString *)string;
- (NSString *)substringWithRange:(NSRange)range;
- (NSString *)substringWithSelection;
- (NSString *)substringWithSelectionForSave;
- (void)setString:(NSString *)string;
- (void)setLineEndingString:(NSString *)lineEndingString;
- (void)replaceTextViewSelectedStringTo:(NSString *)inString scroll:(BOOL)doScroll;
- (void)replaceTextViewAllStringTo:(NSString *)string;
- (void)insertTextViewAfterSelectionStringTo:(NSString *)string;
- (void)appendTextViewAfterAllStringTo:(NSString *)string;
- (NSRange)selectedRange;
- (void)setSelectedRange:(NSRange)charRange;

- (NSFont *)font;
- (void)setFont:(NSFont *)font;

- (void)markupRanges:(NSArray *)ranges;
- (void)clearAllMarkup;

- (BOOL)usesAntialias;

- (void)setThemeWithName:(NSString *)themeName;
- (CETheme *)theme;

- (NSString *)syntaxStyleName;
- (void)setSyntaxStyleName:(NSString *)inName recolorNow:(BOOL)recolorNow;
- (void)recolorAllString;
- (void)updateColoringAndOutlineMenuWithDelay;
- (void)setupColoringTimer;

- (void)setBackgroundAlpha:(CGFloat)alpha;


// Action Message
- (IBAction)toggleLineNumber:(id)sender;
- (IBAction)toggleNavigationBar:(id)sender;
- (IBAction)toggleLineWrap:(id)sender;
- (IBAction)toggleLayoutOrientation:(id)sender;
- (IBAction)toggleAntialias:(id)sender;
- (IBAction)toggleInvisibleChars:(id)sender;
- (IBAction)togglePageGuide:(id)sender;
- (IBAction)toggleAutoTabExpand:(id)sender;
- (IBAction)selectPrevItemOfOutlineMenu:(id)sender;
- (IBAction)selectNextItemOfOutlineMenu:(id)sender;
- (IBAction)openSplitTextView:(id)sender;
- (IBAction)closeSplitTextView:(id)sender;
- (IBAction)recoloringAllStringOfDocument:(id)sender;

@end
