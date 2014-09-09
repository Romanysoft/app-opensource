
@import Cocoa;


@interface CELayoutManager : NSLayoutManager

@property (nonatomic) BOOL showsInvisibles;
@property (nonatomic) BOOL showsSpace;
@property (nonatomic) BOOL showsTab;
@property (nonatomic) BOOL showsNewLine;
@property (nonatomic) BOOL showsFullwidthSpace;
@property (nonatomic) BOOL showsOtherInvisibles;

@property (nonatomic) BOOL fixesLineHeight;  
@property (nonatomic) BOOL usesAntialias;  
@property (nonatomic, getter=isPrinting) BOOL printing;  
@property (nonatomic) NSFont *textFont;

@property (readonly, nonatomic) CGFloat textFontPointSize;
@property (readonly, nonatomic) CGFloat defaultLineHeightForTextFont;  
@property (readonly, nonatomic) CGFloat textFontGlyphY;  


- (void)setValuesForTextFont:(NSFont *)font;
- (CGFloat)lineHeight;

@end
