/*

 CEMenuItemCell
 
 TryEditor
 http://TryEditor.github.io
 
 Created on 2014-04-13 by 1024jp
 encoding="UTF-8"
 ------------------------------------------------------------------------------
 
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

#import "CEMenuItemCell.h"
#import "constants.h"


@implementation CEMenuItemCell

#pragma mark Superclass Methods


/// セルの描画
- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView

{
    if ([self isSeparator]) {
        [[NSColor gridColor] set];
        [NSBezierPath strokeLineFromPoint:NSMakePoint(NSMinX(cellFrame), floor(NSMidY(cellFrame)) + 0.5)
                                  toPoint:NSMakePoint(NSMaxX(cellFrame), floor(NSMidY(cellFrame)) + 0.5)];
    
    } else {
        [super drawInteriorWithFrame:cellFrame inView:controlView];
    }
}



#pragma mark Public Methods


/// 自身がセパレータかどうかを返す
- (BOOL)isSeparator

{
    return [[self stringValue] isEqualTo:CESeparatorString];
}

@end
