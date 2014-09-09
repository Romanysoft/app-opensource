/*

 constants
 
 TryEditor
 http://TryEditor.github.io
 
 Created on 2004-12-13 by nakamuxu
 encoding="UTF-8"
 ------------------------------------------------------------------------------
 
 © 2004-2007 nakamuxu
 © 2014 TryEditor Project
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation; either version 2 of the License, or (at your option) any later
 version.
 
 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License along with
 this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 Place - Suite 330, Boston, MA  02111-1307, USA.
 

 */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

@import AppKit;


#pragma mark General


// General


// Separator
extern NSString *const CESeparatorString;

// Error domain
extern NSString *const CEErrorDomain;

typedef NS_ENUM(NSInteger, CEErrorCode) {
    CEInvalidNameError = 1000,
    CEThemeFileDuplicationError,
};

// Localized Strings Table
extern NSString *const k_printLocalizeTable;



#pragma mark Notifications


// Notifications


// Notification name
extern NSString *const CEEncodingListDidUpdateNotification;
extern NSString *const BaseDocumentDidFinishOpenNotification;

// General notification's userInfo keys
extern NSString *const CEOldNameKey;
extern NSString *const CENewNameKey;



#pragma mark User Defaults


// User Defaults Keys


// normal settings
extern NSString *const k_key_layoutTextVertical;
extern NSString *const k_key_splitViewVertical;
extern NSString *const k_key_showLineNumbers;
extern NSString *const k_key_showStatusBar;
extern NSString *const k_key_showStatusBarLines;
extern NSString *const k_key_showStatusBarLength;
extern NSString *const k_key_showStatusBarChars;
extern NSString *const k_key_showStatusBarWords;
extern NSString *const k_key_showStatusBarLocation;
extern NSString *const k_key_showStatusBarLine;
extern NSString *const k_key_showStatusBarColumn;
extern NSString *const k_key_showStatusBarEncoding;
extern NSString *const k_key_showStatusBarLineEndings;
extern NSString *const k_key_showStatusBarFileSize;
extern NSString *const k_key_countLineEndingAsChar;
extern NSString *const k_key_syncFindPboard;
extern NSString *const k_key_inlineContextualScriptMenu;
extern NSString *const k_key_showNavigationBar;
extern NSString *const k_key_wrapLines;
extern NSString *const k_key_defaultEncodingCode;
extern NSString *const k_key_defaultLineEndCharCode;
extern NSString *const k_key_encodingList;
extern NSString *const k_key_fontName;
extern NSString *const k_key_fontSize;
extern NSString *const k_key_encodingInOpen;
extern NSString *const k_key_encodingInNew;
extern NSString *const k_key_referToEncodingTag;
extern NSString *const k_key_createNewAtStartup;
extern NSString *const k_key_reopenBlankWindow;
extern NSString *const k_key_checkSpellingAsType;
extern NSString *const k_key_windowWidth;
extern NSString *const k_key_windowHeight;
extern NSString *const k_key_autoExpandTab;
extern NSString *const k_key_tabWidth;
extern NSString *const k_key_windowAlpha;
extern NSString *const k_key_autoIndent;
extern NSString *const k_key_invisibleCharactersColor;
extern NSString *const k_key_showInvisibleSpace;
extern NSString *const k_key_invisibleSpace;
extern NSString *const k_key_showInvisibleTab;
extern NSString *const k_key_invisibleTab;
extern NSString *const k_key_showInvisibleNewLine;
extern NSString *const k_key_invisibleNewLine;
extern NSString *const k_key_showInvisibleFullwidthSpace;
extern NSString *const k_key_invisibleFullwidthSpace;
extern NSString *const k_key_showOtherInvisibleChars;
extern NSString *const k_key_highlightCurrentLine;
extern NSString *const k_key_doColoring;
extern NSString *const k_key_defaultColoringStyleName;
extern NSString *const k_key_defaultTheme;
extern NSString *const k_key_delayColoring;
extern NSString *const k_key_fileDropArray;
extern NSString *const k_key_fileDropExtensions;
extern NSString *const k_key_fileDropFormatString;
extern NSString *const k_key_NSDragAndDropTextDelay;
extern NSString *const k_key_smartInsertAndDelete;
extern NSString *const k_key_shouldAntialias;
extern NSString *const k_key_autoComplete;
extern NSString *const k_key_completeAddStandardWords;
extern NSString *const k_key_showPageGuide;
extern NSString *const k_key_pageGuideColumn;
extern NSString *const k_key_lineSpacing;
extern NSString *const k_key_swapYenAndBackSlashKey;
extern NSString *const k_key_fixLineHeight;
extern NSString *const k_key_highlightBraces;
extern NSString *const k_key_highlightLtGt;
extern NSString *const k_key_saveUTF8BOM;
extern NSString *const k_key_enableSmartQuotes;
extern NSString *const k_key_enableSmartIndent;
extern NSString *const k_key_appendsCommentSpacer;
extern NSString *const k_key_commentsAtLineHead;

// print settings
extern NSString *const k_key_setPrintFont;
extern NSString *const k_key_printFontName;
extern NSString *const k_key_printFontSize;
extern NSString *const k_key_printTheme;
extern NSString *const k_key_printHeader;
extern NSString *const k_key_headerOneStringIndex;
extern NSString *const k_key_headerTwoStringIndex;
extern NSString *const k_key_headerOneAlignIndex;
extern NSString *const k_key_headerTwoAlignIndex;
extern NSString *const k_key_printHeaderSeparator;
extern NSString *const k_key_printFooter;
extern NSString *const k_key_footerOneStringIndex;
extern NSString *const k_key_footerTwoStringIndex;
extern NSString *const k_key_footerOneAlignIndex;
extern NSString *const k_key_footerTwoAlignIndex;
extern NSString *const k_key_printFooterSeparator;
extern NSString *const k_key_printLineNumIndex;
extern NSString *const k_key_printInvisibleCharIndex;
extern NSString *const k_key_printColorIndex;

// settings that are not in preferences
extern NSString *const k_key_insertCustomTextArray;
extern NSString *const k_key_insertCustomText;
extern NSString *const k_key_colorCodeType;

// hidden settings
extern NSString *const k_key_usesTextFontForInvisibles;
extern NSString *const k_key_lineNumFontName;
extern NSString *const k_key_lineNumFontColor;
extern NSString *const k_key_basicColoringDelay;
extern NSString *const k_key_firstColoringDelay;
extern NSString *const k_key_secondColoringDelay;
extern NSString *const k_key_autoCompletionDelay;
extern NSString *const k_key_lineNumUpdateInterval;
extern NSString *const k_key_infoUpdateInterval;
extern NSString *const k_key_incompatibleCharInterval;
extern NSString *const k_key_outlineMenuInterval;
extern NSString *const k_key_outlineMenuMaxLength;
extern NSString *const k_key_headerFooterFontName;
extern NSString *const k_key_headerFooterFontSize;
extern NSString *const k_key_headerFooterDateFormat;
extern NSString *const k_key_headerFooterPathAbbreviatingWithTilde;
extern NSString *const k_key_textContainerInsetWidth;
extern NSString *const k_key_textContainerInsetHeightTop;
extern NSString *const k_key_textContainerInsetHeightBottom;
extern NSString *const k_key_showColoringIndicatorTextLength;
extern NSString *const k_key_runAppleScriptInLaunching;
extern NSString *const k_key_showAlertForNotWritable;
extern NSString *const k_key_notifyEditByAnother;
extern NSString *const k_key_coloringRangeBufferLength;




// User Defaults Values


typedef NS_ENUM(NSUInteger, CELineEnding) {
    CELineEndingLF,
    CELineEndingCR,
    CELineEndingCRLF
};

typedef NS_ENUM(NSUInteger, CEColorPrintMode) {
    CEBlackColorPrint,
    CESameAsDocumentColorPrint
};

typedef NS_ENUM(NSUInteger, CELineNumberPrintMode) {
    CENoLinePrint,
    CESameAsDocumentLinePrint,
    CEDoLinePrint
};

typedef NS_ENUM(NSUInteger, CEInvisibleCharsPrintMode) {
    CENoInvisibleCharsPrint,
    CESameAsDocumentInvisibleCharsPrint,
    CEAllInvisibleCharsPrint
};

typedef NS_ENUM(NSUInteger, CEPrintInfoType) {
    CENoPrintInfo,
    CESyntaxNamePrintInfo,
    BaseDocumentNamePrintInfo,
    CEFilePathPrintInfo,
    CEPrintDatePrintInfo,
    CEPageNumberPrintInfo
};

typedef NS_ENUM(NSUInteger, CEAlignmentType) {
    CEAlignLeft,
    CEAlignCenter,
    CEAlignRight
};




// Setting thresholds


// Page guide column
extern NSUInteger const k_minPageGuideColumn;
extern NSUInteger const k_maxPageGuideColumn;



#pragma mark Syntax


// Syntax


// syntax parsing
extern NSUInteger const k_maxEscapesCheckLength;
extern NSString  *const k_allAlphabetChars;

// syntax style keys
extern NSString *const k_SCKey_styleName;
extern NSString *const k_SCKey_extensions;
extern NSString *const k_SCKey_filenames;
extern NSString *const k_SCKey_ignoreCase;
extern NSString *const k_SCKey_regularExpression;
extern NSString *const k_SCKey_arrayKeyString;
extern NSString *const k_SCKey_beginString;
extern NSString *const k_SCKey_endString;
extern NSString *const k_SCKey_inlineComment;
extern NSString *const k_SCKey_beginComment;
extern NSString *const k_SCKey_endComment;
extern NSString *const k_SCKey_bold;
extern NSString *const k_SCKey_underline;
extern NSString *const k_SCKey_italic;
extern NSString *const k_SCKey_keywordsArray;
extern NSString *const k_SCKey_commandsArray;
extern NSString *const k_SCKey_typesArray;
extern NSString *const k_SCKey_attributesArray;
extern NSString *const k_SCKey_variablesArray;
extern NSString *const k_SCKey_valuesArray;
extern NSString *const k_SCKey_numbersArray;
extern NSString *const k_SCKey_stringsArray;
extern NSString *const k_SCKey_charactersArray;
extern NSString *const k_SCKey_commentsArray;
extern NSString *const k_SCKey_commentDelimitersDict;
extern NSString *const k_SCKey_outlineMenuArray;
extern NSString *const k_SCKey_completionsArray;
extern NSString *const k_SCKey_allColoringArrays[];
extern NSUInteger const k_size_of_allColoringArrays;



#pragma mark Main Menu


// Main Menu


// Main menu indexes
typedef NS_ENUM(NSUInteger, CEMainMenuIndex) {
    CEApplicationMenuIndex,
    CEFileMenuIndex,
    CEEditMenuIndex,
    CEViewMenuIndex,
    CEFormatMenuIndex,
    CEFindMenuIndex,
    CEUtilityMenuIndex,
    CEWindowMenuIndex,
    CEScriptMenuIndex,
};

// Menu item tags
typedef NS_ENUM(NSInteger, CEMenuItemTag) {
    // in main menu
    CENewMenuItemTag            =  100,
    CEOpenMenuItemTag           =  101,
    CEOpenHiddenMenuItemTag     =  102,
    CEOpenRecentMenuItemTag     =  103,
    CEInputBackSlashMenuItemTag =  209,
    CEFileEncodingMenuItemTag   = 4001,
    CESyntaxMenuItemTag         = 4002,
    CEThemeMenuItemTag          = 4003,
    CEServicesMenuItemTag       =  999,  // const not to list up in "Menu Key Bindings" Setting
    CEWindowPanelsMenuItemTag   = 7999,  // const not to list up in "Menu Key Bindings" Setting
    CEScriptMenuDirectoryTag    = 8999,  // const not to list up in "Menu Key Bindings" Setting
    
    // in contextual menu
    CEUtilityMenuItemTag        =  600,
    CEScriptMenuItemTag         =  800,
};

// Help document file names table
extern NSString *const k_bundledDocumentFileNames[];

// Online URLs
extern NSString *const k_webSiteURL;
extern NSString *const k_issueTrackerURL;
extern NSString *const k_onlineHelpURL;



#pragma mark CEEditorWrapper


// CEEditorWrapper


// Outline item dict keys
extern NSString *const CEOutlineItemTitleKey;
extern NSString *const CEOutlineItemRangeKey;
extern NSString *const CEOutlineItemSortKeyKey;
extern NSString *const CEOutlineItemFontBoldKey;
extern NSString *const CEOutlineItemFontItalicKey;
extern NSString *const CEOutlineItemUnderlineMaskKey;

// layout constants
extern CGFloat const k_defaultLineNumWidth;
extern CGFloat const k_lineNumPadding;
extern CGFloat const k_lineNumFontDescender;
extern NSString *const k_navigationBarFontName;



#pragma mark ATSTypesetter


// ATSTypesetter


// ATSTypesetter (Layouting)
extern CGFloat const k_defaultLineHeightMultiple;



#pragma mark Print


// Print


extern CGFloat const k_printTextHorizontalMargin;  // left/light margin for text
extern CGFloat const k_printHFHorizontalMargin;    // left/light margin for header/footer
extern CGFloat const k_printHFVerticalMargin;      // top/bottom margin for header/footer
extern CGFloat const k_headerFooterLineHeight;
extern CGFloat const k_separatorPadding;
extern CGFloat const k_noSeparatorPadding;



#pragma mark CEWindowController


// CEWindowController


// Drawer identifier
extern NSString *const k_infoIdentifier;
extern NSString *const k_incompatibleIdentifier;

// listController key
extern NSString *const k_listLineNumber;
extern NSString *const k_incompatibleRange;
extern NSString *const k_incompatibleChar;
extern NSString *const k_convertedChar;



#pragma mark Preferences


// Preferences


// Help anchors
extern NSString *const k_helpPrefAnchors[];



#pragma mark Document Window


// Document Window


// Line Endings
extern NSString *const k_lineEndingNames[];

// Toolbar item identifier
extern NSString *const k_docWindowToolbarID;
extern NSString *const k_getInfoItemID;
extern NSString *const k_showIncompatibleCharItemID;
extern NSString *const k_biggerFontItemID;
extern NSString *const k_smallerFontItemID;
extern NSString *const k_toggleCommentItemID;
extern NSString *const k_shiftLeftItemID;
extern NSString *const k_shiftRightItemID;
extern NSString *const k_autoTabExpandItemID;
extern NSString *const k_showNavigationBarItemID;
extern NSString *const k_showLineNumItemID;
extern NSString *const k_showStatusBarItemID;
extern NSString *const k_showInvisibleCharsItemID;
extern NSString *const k_showPageGuideItemID;
extern NSString *const k_wrapLinesItemID;
extern NSString *const k_textOrientationItemID;
extern NSString *const k_lineEndingsItemID;
extern NSString *const k_fileEncodingsItemID;
extern NSString *const k_syntaxItemID;
extern NSString *const k_syntaxReColorAllItemID;
extern NSString *const k_editColorCodeItemID;



#pragma mark KeyBindingManager


// KeyBindingManager


// outlineView data key, column identifier
extern NSString *const k_title;
extern NSString *const k_children;
extern NSString *const k_keyBindingKey;
extern NSString *const k_selectorString;



#pragma mark Encodings


// Encodings


// Encoding menu
extern NSInteger const k_autoDetectEncodingMenuTag;

// Max length to scan encoding declaration
extern NSUInteger        const k_maxEncodingScanLength;

// Encodings list
extern CFStringEncodings const k_CFStringEncodingList[];
extern NSUInteger        const k_size_of_CFStringEncodingList;

// Encodings that need convert Yen mark to back-slash
extern CFStringEncodings const k_CFStringEncodingInvalidYenList[];
extern NSUInteger        const k_size_of_CFStringEncodingInvalidYenList;

// Yen mark char
extern unichar const k_yenMark;




// Invisibles


// Substitutes for invisible characters
extern unichar    const k_invisibleSpaceCharList[];
extern NSUInteger const k_size_of_invisibleSpaceCharList;

extern unichar    const k_invisibleTabCharList[];
extern NSUInteger const k_size_of_invisibleTabCharList;

extern unichar    const k_invisibleNewLineCharList[];
extern NSUInteger const k_size_of_invisibleNewLineCharList;

extern unichar    const k_invisibleFullwidthSpaceCharList[];
extern NSUInteger const k_size_of_invisibleFullwidthSpaceCharList;




// Keybindings


// Modifier masks and characters for keybindings
extern NSUInteger const k_modifierKeyMaskList[];
extern unichar    const k_modifierKeySymbolCharList[];
extern unichar    const k_keySpecCharList[];

// size of k_modifierKeyMaskList, k_keySpecCharList and k_modifierKeySymbolCharList
extern NSUInteger const k_size_of_modifierKeys;
// indexes of k_modifierKeyMaskList, k_keySpecCharList and k_modifierKeySymbolCharList
typedef NS_ENUM(NSUInteger, CEModifierKeyIndex) {
    CEControlKeyIndex,
    CEAlternateKeyIndex,
    CEShiftKeyIndex,
    CECommandKeyIndex,
};

// Unprintable key list
extern unichar    const k_unprintableKeyList[];
extern NSUInteger const k_size_of_unprintableKeyList;
