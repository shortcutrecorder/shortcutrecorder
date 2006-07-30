//
//  PTKeyCombo.m
//  Protein
//
//  Created by Quentin Carnicelli on Sat Aug 02 2003.
//  Copyright (c) 2003 Quentin D. Carnicelli. All rights reserved.
//

#import "PTKeyCombo.h"

@implementation PTKeyCombo

+ (id)clearKeyCombo
{
	return [self keyComboWithKeyCode: -1 modifiers: -1];
}

+ (id)keyComboWithKeyCode: (int)keyCode modifiers: (int)modifiers
{
	return [[[self alloc] initWithKeyCode: keyCode modifiers: modifiers] autorelease];
}

- (id)initWithKeyCode: (int)keyCode modifiers: (int)modifiers
{
	self = [super init];
	
	if( self )
	{
		mKeyCode = keyCode;
		mModifiers = modifiers;
	}
	
	return self;
}

- (id)initWithPlistRepresentation: (id)plist
{
	int keyCode, modifiers;
	
	if( !plist || ![plist count] )
	{
		keyCode = -1;
		modifiers = -1;
	}
	else
	{
		keyCode = [[plist objectForKey: @"keyCode"] intValue];
		if( keyCode <= 0 ) keyCode = -1;
	
		modifiers = [[plist objectForKey: @"modifiers"] intValue];
		if( modifiers <= 0 ) modifiers = -1;
	}

	return [self initWithKeyCode: keyCode modifiers: modifiers];
}

- (id)plistRepresentation
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
				[NSNumber numberWithInt: [self keyCode]], @"keyCode",
				[NSNumber numberWithInt: [self modifiers]], @"modifiers",
				nil];
}

- (id)copyWithZone:(NSZone*)zone;
{
	return [self retain];
}

- (BOOL)isEqual: (PTKeyCombo*)combo
{
	return	[self keyCode] == [combo keyCode] &&
			[self modifiers] == [combo modifiers];
}

#pragma mark -

- (int)keyCode
{
	return mKeyCode;
}

- (int)modifiers
{
	return mModifiers;
}

- (BOOL)isValidHotKeyCombo
{
	return mKeyCode >= 0 && mModifiers > 0;
}

- (BOOL)isClearCombo
{
	return mKeyCode == -1 && mModifiers == -1;
}

@end