/*

 ATSTypesetter
 

 */

#import "ATSTypesetter.h"
#import "CETextViewProtocol.h"


@implementation ATSTypesetter

#pragma mark Class Methods

//=======================================================
// Class method
//
//=======================================================


+ (instancetype)sharedSystemTypesetter

{
    static dispatch_once_t predicate;
    static id shared = nil;
    
    dispatch_once(&predicate, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}



#pragma mark Superclass Methods


- (BOOL)usesFontLeading

{
    CELayoutManager *manager = (CELayoutManager *)[self layoutManager];

    return ([manager isPrinting] || ![manager fixesLineHeight]);
}


- (CGFloat)lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect

{
    CELayoutManager *manager = (CELayoutManager *)[self layoutManager];
    CGFloat lineSpacing = [(NSTextView<CETextViewProtocol> *)[[self currentTextContainer] textView] lineSpacing];
    CGFloat fontSize;

    if ([manager isPrinting] || ![manager fixesLineHeight]) {

        CGFloat spacing = [super lineSpacingAfterGlyphAtIndex:glyphIndex withProposedLineFragmentRect:rect];
        fontSize = [[[[self currentTextContainer] textView] font] pointSize];

        return (spacing + lineSpacing * fontSize);

    }

    CGFloat defaultLineHeight = [manager defaultLineHeightForTextFont];
    fontSize = [manager textFontPointSize];


    return floor(defaultLineHeight - rect.size.height + lineSpacing * fontSize + 0.5);
}

@end
