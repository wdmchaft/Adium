/* 
 * Adium is the legal property of its developers, whose names are listed in the copyright file included
 * with this source distribution.
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program; if not,
 * write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#import <Adium/AILocalizationButton.h>

#define	TARGET_CONTROL	super

@implementation AILocalizationButton

//Set up our defaults
- (void)_initLocalizationControl
{
	rightAnchorMovementType = AILOCALIZATION_MOVE_SELF;
}

- (void)setTitle:(NSString *)inTitle
{
	NSRect			oldFrame;
	
	//If the old frame is smaller than our original frame, treat the old frame as that original frame
	//for resizing and positioning purposes
	oldFrame  = [self frame];
	if (oldFrame.size.width < originalFrame.size.width) {
		oldFrame = originalFrame;
	}
	
	//Set to inTitle, then sizeToFit
	[super setTitle:inTitle];
	
	[self _handleSizingWithOldFrame:oldFrame stringValue:inTitle];
}

#include "AILocalizationControl.m"

@end

@implementation NSButton (AILocalizationAssistance)
- (void)setLocalizedString:(NSString *)inString
{
	if ([self isKindOfClass:[AILocalizationButton class]]) {
		[self setTitle:inString];
	}
}
@end
