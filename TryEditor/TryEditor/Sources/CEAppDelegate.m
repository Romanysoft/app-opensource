/*

 CEAppDelegate
 
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

#import "AppDelegate.h"
#import "CESyntaxManager.h"
#import "CEKeyBindingManager.h"
#import "CEScriptManager.h"
#import "CEThemeManager.h"
#import "CEPreferencesWindowController.h"
#import "ByteCountTransformer.h"
#import "CELineHeightTransformer.h"
#import "CEOpacityPanelController.h"
#import "CELineSpacingPanelController.h"
#import "CEGoToSheetController.h"
#import "ColorCodePanelController.h"
#import "CEScriptErrorPanelController.h"
#import "CEUnicodeInputPanelController.h"
#import "constants.h"


@interface CEAppDelegate ()

// readonly
@property (readwrite, nonatomic, copy) NSArray *encodingMenuItems;

@end




#pragma mark -

@implementation CEAppDelegate

#pragma mark Class Methods

//=======================================================
// Class method
//
//=======================================================


/// set binding keys and values
+ (void)initialize

{
    // Encoding list
    NSMutableArray *encodings = [[NSMutableArray alloc] initWithCapacity:k_size_of_CFStringEncodingList];
    for (NSUInteger i = 0; i < k_size_of_CFStringEncodingList; i++) {
        [encodings addObject:@(k_CFStringEncodingList[i])];
    }
    
    NSDictionary *defaults = @{k_key_layoutTextVertical: @NO,
                               k_key_splitViewVertical: @NO,
                               k_key_showLineNumbers: @YES,
                               k_key_showStatusBar: @YES,
                               k_key_showStatusBarLines: @YES,
                               k_key_showStatusBarLength: @NO,
                               k_key_showStatusBarChars: @YES,
                               k_key_showStatusBarWords: @NO,
                               k_key_showStatusBarLocation: @YES,
                               k_key_showStatusBarLine: @YES,
                               k_key_showStatusBarColumn: @NO,
                               k_key_showStatusBarEncoding: @NO,
                               k_key_showStatusBarLineEndings: @NO,
                               k_key_showStatusBarFileSize: @YES,
                               k_key_countLineEndingAsChar: @YES,
                               k_key_syncFindPboard: @NO,
                               k_key_inlineContextualScriptMenu: @NO,
                               k_key_showNavigationBar: @YES,
                               k_key_wrapLines: @YES,
                               k_key_defaultLineEndCharCode: @0,
                               k_key_encodingList: encodings,
                               k_key_fontName: [[NSFont controlContentFontOfSize:[NSFont systemFontSize]] fontName],
                               k_key_fontSize: @([NSFont systemFontSize]),
                               k_key_encodingInOpen: @(k_autoDetectEncodingMenuTag),
                               k_key_encodingInNew: @(CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)),
                               k_key_referToEncodingTag: @YES,
                               k_key_createNewAtStartup: @YES,
                               k_key_reopenBlankWindow: @YES,
                               k_key_checkSpellingAsType: @NO,
                               k_key_windowWidth: @600.0f,
                               k_key_windowHeight: @450.0f,
                               k_key_autoExpandTab: @NO,
                               k_key_tabWidth: @4U,
                               k_key_windowAlpha: @1.0f,
                               k_key_autoIndent: @YES,
                               k_key_showInvisibleSpace: @NO,
                               k_key_invisibleSpace: @0U,
                               k_key_showInvisibleTab: @NO,
                               k_key_invisibleTab: @0U,
                               k_key_showInvisibleNewLine: @NO,
                               k_key_invisibleNewLine: @0U,
                               k_key_showInvisibleFullwidthSpace: @NO,
                               k_key_invisibleFullwidthSpace: @0U,
                               k_key_showOtherInvisibleChars: @NO,
                               k_key_highlightCurrentLine: @NO,
                               k_key_defaultTheme: @"Dendrobates",
                               k_key_doColoring: @YES,
                               k_key_defaultColoringStyleName: NSLocalizedString(@"None", nil),
                               k_key_delayColoring: @NO,
                               k_key_fileDropArray: @[@{k_key_fileDropExtensions: @"jpg, jpeg, gif, png",
                                                        k_key_fileDropFormatString: @"<img src=\"<<<RELATIVE-PATH>>>\" alt=\"<<<FILENAME-NOSUFFIX>>>\" title=\"<<<FILENAME-NOSUFFIX>>>\" width=\"<<<IMAGEWIDTH>>>\" height=\"<<<IMAGEHEIGHT>>>\" />"}],
                               k_key_NSDragAndDropTextDelay: @1,
                               k_key_smartInsertAndDelete: @NO,
                               k_key_enableSmartQuotes: @NO,
                               k_key_enableSmartIndent: @YES,
                               k_key_appendsCommentSpacer: @YES,
                               k_key_commentsAtLineHead: @YES,
                               k_key_shouldAntialias: @YES,
                               k_key_autoComplete: @NO,
                               k_key_completeAddStandardWords: @2U,
                               k_key_showPageGuide: @NO,
                               k_key_pageGuideColumn: @80,
                               k_key_lineSpacing: @0.3f,
                               k_key_swapYenAndBackSlashKey: @NO,
                               k_key_fixLineHeight: @YES,
                               k_key_highlightBraces: @YES,
                               k_key_highlightLtGt: @NO,
                               k_key_saveUTF8BOM: @NO,
                               k_key_setPrintFont: @0,
                               k_key_printFontName: [[NSFont controlContentFontOfSize:[NSFont systemFontSize]] fontName],
                               k_key_printFontSize: @([NSFont systemFontSize]),
                               k_key_printHeader: @YES,
                               k_key_headerOneStringIndex: @3,
                               k_key_headerTwoStringIndex: @4,
                               k_key_headerOneAlignIndex: @0,
                               k_key_headerTwoAlignIndex: @2,
                               k_key_printHeaderSeparator: @YES,
                               k_key_printFooter: @YES,
                               k_key_footerOneStringIndex: @0,
                               k_key_footerTwoStringIndex: @5,
                               k_key_footerOneAlignIndex: @0,
                               k_key_footerTwoAlignIndex: @1,
                               k_key_printFooterSeparator: @YES,
                               k_key_printLineNumIndex: @0,
                               k_key_printInvisibleCharIndex: @0,
                               k_key_printColorIndex: @0,
                               
                               /* -------- 以下、環境設定にない設定項目 -------- */
                               k_key_insertCustomTextArray: @[@"<br />\n", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"",
                                                              @"", @"", @"", @"", @"", @"", @"", @"", @"", @"",
                                                              @"", @"", @"", @"", @"", @"", @"", @"", @"", @""],
                               k_key_colorCodeType:@1,
                               
                               /* -------- 以下、隠し設定 -------- */
                               k_key_usesTextFontForInvisibles: @NO,
                               k_key_lineNumFontName: @"Menlo",
                               k_key_lineNumFontColor: [NSArchiver archivedDataWithRootObject:[NSColor darkGrayColor]], 
                               k_key_basicColoringDelay: @0.001f, 
                               k_key_firstColoringDelay: @0.3f, 
                               k_key_secondColoringDelay: @0.7f,
                               k_key_autoCompletionDelay: @0.25,
                               k_key_lineNumUpdateInterval: @0.12f, 
                               k_key_infoUpdateInterval: @0.2f, 
                               k_key_incompatibleCharInterval: @0.42f, 
                               k_key_outlineMenuInterval: @0.37f, 
                               k_key_outlineMenuMaxLength: @110U, 
                               k_key_headerFooterFontName: [[NSFont systemFontOfSize:[NSFont systemFontSize]] fontName], 
                               k_key_headerFooterFontSize: @10.0f, 
                               k_key_headerFooterDateFormat: @"YYYY-MM-dd HH:mm",
                               k_key_headerFooterPathAbbreviatingWithTilde: @YES, 
                               k_key_textContainerInsetWidth: @0.0f, 
                               k_key_textContainerInsetHeightTop: @4.0f, 
                               k_key_textContainerInsetHeightBottom: @16.0f, 
                               k_key_showColoringIndicatorTextLength: @115000U, 
                               k_key_runAppleScriptInLaunching: @YES, 
                               k_key_showAlertForNotWritable: @YES, 
                               k_key_notifyEditByAnother: @YES,
                               k_key_coloringRangeBufferLength: @5000};
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    // 出荷時へのリセットが必要な項目に付いては NSUserDefaultsController に初期値をセットする
    NSArray *resettableKeys = @[k_key_encodingList,
                                k_key_insertCustomTextArray,
                                k_key_windowWidth,
                                k_key_windowHeight];
    NSDictionary *initialValuesDict = [defaults dictionaryWithValuesForKeys:resettableKeys];
    [[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:initialValuesDict];

    // transformer 登録
    [NSValueTransformer setValueTransformer:[[ByteCountTransformer alloc] init]
                                    forName:@"ByteCountTransformer"];
    [NSValueTransformer setValueTransformer:[[CELineHeightTransformer alloc] init]
                                    forName:@"CELineHeightTransformer"];
}



#pragma mark Superclass Methods

//=======================================================
// Superclass method
//
//=======================================================


/// あとかたづけ
- (void)dealloc

{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark Public Methods

//=======================================================
// Public method
//
//=======================================================

//------------------------------------------------------
/// エンコーディングメニューアイテムを生成
- (void)buildEncodingMenuItems
//------------------------------------------------------
{
    NSArray *encodings = [[NSUserDefaults standardUserDefaults] arrayForKey:k_key_encodingList];
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:[encodings count]];
    
    for (NSNumber *encodingNumber in encodings) {
        CFStringEncoding cfEncoding = [encodingNumber unsignedLongValue];
        NSMenuItem *item;
        
        if (cfEncoding == kCFStringEncodingInvalidId) {
            item = [NSMenuItem separatorItem];
        } else {
            NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding);
            NSString *menuTitle = [NSString localizedNameOfStringEncoding:encoding];
            item = [[NSMenuItem alloc] initWithTitle:menuTitle action:NULL keyEquivalent:@""];
            [item setTag:encoding];
        }
        
        [items addObject:item];
    }
    
    [self setEncodingMenuItems:items];
    
    // リストのできあがりを通知
    [[NSNotificationCenter defaultCenter] postNotificationName:CEEncodingListDidUpdateNotification object:self];
}



#pragma mark Protocol

//=======================================================
// NSNibAwaking Protocol
//
//=======================================================


/// Nibファイル読み込み直後
- (void)awakeFromNib

{
    [self buildEncodingMenuItems];
    [self setupSupportDirectory];
    
    // build menus
    [self buildEncodingMenu];
    [self buildSyntaxMenu];
    [self buildThemeMenu];
    [[CEScriptManager sharedManager] buildScriptMenu:nil];
    
    // エンコーディングリスト更新の通知依頼
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(buildEncodingMenu)
                                                 name:CEEncodingListDidUpdateNotification
                                               object:nil];
    
    // シンタックススタイルリスト更新の通知依頼
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(buildSyntaxMenu)
                                                 name:CESyntaxListDidUpdateNotification
                                               object:nil];
    // テーマリスト更新の通知依頼
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(buildThemeMenu)
                                                 name:CEThemeListDidUpdateNotification
                                               object:nil];
}



#pragma mark Delegate and Notification

//=======================================================
// Delegate method (NSApplication)
//  <== File's Owner
//=======================================================


/// アプリ起動時に新規ドキュメント作成
- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender

{
    return [[NSUserDefaults standardUserDefaults] boolForKey:k_key_createNewAtStartup];
}



/// Re-Open AppleEvents へ対応してウィンドウを開くかどうかを返す
- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag

{
    BOOL shouldReopen = [[NSUserDefaults standardUserDefaults] boolForKey:k_key_reopenBlankWindow];

    if (shouldReopen) {
        return YES;
        
    } else if (flag) {
        // Re-Open に応えない設定でウィンドウがあるときは、すべてのウィンドウをチェックしひとつでも通常通り表示されていれば
        // NO を返し何もしない。表示されているウィンドウがすべて Dock にしまわれているときは、そのうちひとつを通常表示させる
        // ため、YES を返す。
        for (NSWindow *window in [NSApp windows]) {
            if ([window isVisible] && ![window isMiniaturized]) {
                return NO;
            }
        }
        
        return YES;
    }
    // Re-Open に応えず、かつウィンドウもないときは何もしない
    return NO;
}



/// アプリ起動直後
- (void)applicationDidFinishLaunching:(NSNotification *)notification

{
    // （CEKeyBindingManagerによって、キーボードショートカット設定は上書きされる。
    // アプリに内包する MenuKeyBindings.plist に、ショートカット設定を記述する必要がある。2007.05.19）

    // 「Select Outline item」「Goto」メニューを生成／追加
    NSMenu *findMenu = [[[NSApp mainMenu] itemAtIndex:CEFindMenuIndex] submenu];
    NSMenuItem *menuItem;

    [findMenu addItem:[NSMenuItem separatorItem]];
    unichar upKey = NSUpArrowFunctionKey;
    menuItem = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Select Prev Outline Item", nil)
                                          action:@selector(selectPrevItemOfOutlineMenu:)
                                   keyEquivalent:[NSString stringWithCharacters:&upKey length:1]];
    [menuItem setKeyEquivalentModifierMask:(NSCommandKeyMask | NSAlternateKeyMask)];
    [findMenu addItem:menuItem];

    unichar downKey = NSDownArrowFunctionKey;
    menuItem = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Select Next Outline Item", nil)
                                          action:@selector(selectNextItemOfOutlineMenu:)
                                   keyEquivalent:[NSString stringWithCharacters:&downKey length:1]];
    [menuItem setKeyEquivalentModifierMask:(NSCommandKeyMask | NSAlternateKeyMask)];
    [findMenu addItem:menuItem];

    [findMenu addItem:[NSMenuItem separatorItem]];
    menuItem = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Go To…", nil)
                                          action:@selector(gotoLocation:)
                                   keyEquivalent:@"l"];
    [findMenu addItem:menuItem];
    
    // AppleScript 起動のスピードアップのため一度動かしておく
    if ([[NSUserDefaults standardUserDefaults] boolForKey:k_key_runAppleScriptInLaunching]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *source = @"tell application \"TryEditor\" to number of documents";
            NSAppleScript *AppleScript = [[NSAppleScript alloc] initWithSource:source];
            [AppleScript executeAndReturnError:nil];
        });
    }
    
    // KeyBindingManagerをセットアップ
    [[CEKeyBindingManager sharedManager] setupAtLaunching];
}



/// Dock メニュー生成
- (NSMenu *)applicationDockMenu:(NSApplication *)sender

{
    NSMenu *menu = [[NSMenu alloc] init];
    NSMenuItem *newItem = [[[[[NSApp mainMenu] itemAtIndex:CEFileMenuIndex] submenu] itemWithTag:CENewMenuItemTag] copy];
    NSMenuItem *openItem = [[[[[NSApp mainMenu] itemAtIndex:CEFileMenuIndex] submenu] itemWithTag:CEOpenMenuItemTag] copy];

    [newItem setAction:@selector(newInDockMenu:)];
    [openItem setAction:@selector(openInDockMenu:)];

    [menu addItem:newItem];
    [menu addItem:openItem];

    return menu;
}



/// ファイルを開く
- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename

{
    // テーマファイルの場合はインストール処理をする
    if ([[filename pathExtension] isEqualToString:@"trytheme"]) {
        NSURL *URL = [NSURL fileURLWithPath:filename];
        NSString *themeName = [[URL lastPathComponent] stringByDeletingPathExtension];
        NSAlert *alert;
        NSInteger returnCode;
        
        // テーマファイルをテキストファイルとして開くかを訊く
        alert = [[NSAlert alloc] init];
        [alert setMessageText:[NSString stringWithFormat:NSLocalizedString(@"“%@” is a TryEditor theme file.", nil), [URL lastPathComponent]]];
        [alert setInformativeText:NSLocalizedString(@"Do you want to install this theme?", nil)];
        [alert addButtonWithTitle:NSLocalizedString(@"Install", nil)];
        [alert addButtonWithTitle:NSLocalizedString(@"Open as Text File", nil)];
        
        returnCode = [alert runModal];
        if (returnCode == NSAlertSecondButtonReturn) {  // Edit as Text File
            return NO;
        }
        
        // テーマ読み込みを実行
        NSError *error = nil;
        [[CEThemeManager sharedManager] importTheme:URL replace:NO error:&error];
        
        // すでに同名のテーマが存在する場合は置き換えて良いかを訊く
        if ([error code] == CEThemeFileDuplicationError) {
            alert = [NSAlert alertWithError:error];
            
            returnCode = [alert runModal];
            if (returnCode == NSAlertFirstButtonReturn) {  // Canceled
                return YES;
            } else {
                error = nil;
                [[CEThemeManager sharedManager] importTheme:URL replace:YES error:&error];
            }
        }
        
        if (error) {
            alert = [NSAlert alertWithError:error];
        } else {
            [[NSSound soundNamed:@"Glass"] play];
            alert = [[NSAlert alloc] init];
            [alert setMessageText:[NSString stringWithFormat:NSLocalizedString(@"A new theme named “%@” has been successfully installed.", nil), themeName]];
        }
        [alert runModal];
        
        return YES;
    }
    return NO;
}



/// メニューの有効化／無効化を制御
- (BOOL)validateMenuItem:(NSMenuItem *)menuItem

{
    if (([menuItem action] == @selector(openLineSpacingPanel:)) ||
        ([menuItem action] == @selector(openUnicodeInputPanel:))) {
        return ([[NSDocumentController sharedDocumentController] currentDocument] != nil);
    }
    
    return YES;
}



#pragma mark Action Messages

//=======================================================
// Action messages
//
//=======================================================


/// 環境設定ウィンドウを開く
- (IBAction)openPrefWindow:(id)sender

{
    [[CEPreferencesWindowController sharedController] showWindow:self];
}



/// アップルスクリプト辞書をスクリプトエディタで開く
- (IBAction)openAppleScriptDictionary:(id)sender

{
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"openDictionary" withExtension:@"applescript"];
    NSAppleScript *AppleScript = [[NSAppleScript alloc] initWithContentsOfURL:URL error:nil];
    [AppleScript executeAndReturnError:nil];
}



/// Scriptエラーウィンドウを表示
- (IBAction)openScriptErrorWindow:(id)sender

{
    [[CEScriptErrorPanelController sharedController] showWindow:self];
}



/// カラーコードウィンドウを表示
- (IBAction)openHexColorCodeEditor:(id)sender

{
    [[ColorCodePanelController sharedController] showWindow:self];
}



/// 不透明度パネルを開く
- (IBAction)openOpacityPanel:(id)sender

{
    [[CEOpacityPanelController sharedController] showWindow:self];
}



/// 行間設定パネルを開く
- (IBAction)openLineSpacingPanel:(id)sender

{
    [[CELineSpacingPanelController sharedController] showWindow:self];
}



/// Go Toパネルを開く
- (IBAction)gotoLocation:(id)sender

{
    CEGoToSheetController *sheetController = [[CEGoToSheetController alloc] init];
    [sheetController beginSheetForDocument:[[NSDocumentController sharedDocumentController] currentDocument]];
}



/// Unicode 入力パネルを開く
- (IBAction)openUnicodeInputPanel:(id)sender

{
    [[CEUnicodeInputPanelController sharedController] showWindow:self];
}



/// Dockメニューの「新規」メニューアクション（まず自身をアクティベート）
- (IBAction)newInDockMenu:(id)sender

{
    [NSApp activateIgnoringOtherApps:YES];
    [[NSDocumentController sharedDocumentController] newDocument:nil];
}



/// Dockメニューの「開く」メニューアクション（まず自身をアクティベート）
- (IBAction)openInDockMenu:(id)sender

{
    [NSApp activateIgnoringOtherApps:YES];
    [[NSDocumentController sharedDocumentController] openDocument:nil];
}



/// 付属ドキュメントを開く
- (IBAction)openBundledDocument:(id)sender

{
    NSString *fileName = k_bundledDocumentFileNames[[sender tag]];
    NSURL *URL = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"rtf"];
    
    [[NSWorkspace sharedWorkspace] openURL:URL];
}



/// Webサイト（TryEditor.github.io）を開く
- (IBAction)openWebSite:(id)sender

{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:k_webSiteURL]];
}



/// バグを報告する
- (IBAction)reportBug:(id)sender

{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:k_issueTrackerURL]];
}



/// show online help
- (IBAction)showOnlineHelp:(id)sender

{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:k_onlineHelpURL]];
}


#pragma mark Private Methods

//=======================================================
// Private method
//
//=======================================================

//------------------------------------------------------
/// データ保存用ディレクトリの存在をチェック、なければつくる
- (void)setupSupportDirectory
//------------------------------------------------------
{
    NSURL *URL = [[[NSFileManager defaultManager] URLForDirectory:NSApplicationSupportDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:nil]
                  URLByAppendingPathComponent:@"TryEditor"];
    
    NSNumber *isDirectory;
    if (![URL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:nil]) {
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtURL:URL
                                                withIntermediateDirectories:YES
                                                                 attributes:nil
                                                                      error:nil];
        if (!success) {
            DLog(@"Failed to create support directory for TryEditor...");
        }
    } else if (![isDirectory boolValue]) {
        DLog(@"\"%@\" is not dir.", URL);
    }
}


//------------------------------------------------------
/// フォーマットのエンコーディングメニューアイテムを生成
- (void)buildEncodingMenu
//------------------------------------------------------
{
    NSMenu *menu = [[[[[NSApp mainMenu] itemAtIndex:CEFormatMenuIndex] submenu] itemWithTag:CEFileEncodingMenuItemTag] submenu];
    [menu removeAllItems];
    
    NSArray *items = [[NSArray alloc] initWithArray:[self encodingMenuItems] copyItems:YES];
    for (NSMenuItem *item in items) {
        [item setAction:@selector(changeEncoding:)];
        [item setTarget:nil];
        [menu addItem:item];
    }
}


//------------------------------------------------------
/// シンタックスカラーリングメニューを生成
- (void)buildSyntaxMenu
//------------------------------------------------------
{
    NSMenu *menu = [[[[[NSApp mainMenu] itemAtIndex:CEFormatMenuIndex] submenu] itemWithTag:CESyntaxMenuItemTag] submenu];
    [menu removeAllItems];
    
    // None を追加
    [menu addItemWithTitle:NSLocalizedString(@"None", nil)
                    action:@selector(changeSyntaxStyle:)
             keyEquivalent:@""];
    
    [menu addItem:[NSMenuItem separatorItem]];
    
    // シンタックススタイルをラインナップ
    NSArray *styleNames = [[CESyntaxManager sharedManager] styleNames];
    for (NSString *styleName in styleNames) {
        [menu addItemWithTitle:styleName
                        action:@selector(changeSyntaxStyle:)
                 keyEquivalent:@""];
    }
    
    [menu addItem:[NSMenuItem separatorItem]];
    
    // 全文字列を再カラーリングするメニューを追加
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Re-Color All", nil)
                                                  action:@selector(recoloringAllStringOfDocument:)
                                           keyEquivalent:@"r"];
    [item setKeyEquivalentModifierMask:(NSCommandKeyMask | NSAlternateKeyMask)]; // = Cmd + Opt + R
    [menu addItem:item];
}


//------------------------------------------------------
/// メインメニューのテーマメニューを再構築する
- (void)buildThemeMenu
//------------------------------------------------------
{
    NSMenu *menu = [[[[[NSApp mainMenu] itemAtIndex:CEFormatMenuIndex] submenu] itemWithTag:CEThemeMenuItemTag] submenu];
    [menu removeAllItems];
    
    NSArray *themeNames = [[CEThemeManager sharedManager] themeNames];
    for (NSString *themeName in themeNames) {
        [menu addItemWithTitle:themeName action:@selector(changeTheme:) keyEquivalent:@""];
    }
}

@end
