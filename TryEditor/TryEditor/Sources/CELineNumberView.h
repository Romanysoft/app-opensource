
@import Cocoa;


@interface CELineNumberView : NSView

@property (nonatomic, getter=isShown) BOOL shown;
@property (nonatomic) NSTextView *textView;  
@property (nonatomic) CGFloat backgroundAlpha;


// Public method

- (void)updateLineNumber:(id)sender;

@end
