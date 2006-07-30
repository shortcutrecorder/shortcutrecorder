//
//  AppController.h
//  ShortcutRecorder
//
//  Copyright 2006 Contributors. All rights reserved.
//
//  License: BSD
//
//  Contributors:
//      David Dauer
//      Jesper

#import <Cocoa/Cocoa.h>
#import "SRRecorderControl.h"

@class PTHotKey;

@interface AppController : NSObject
{
	IBOutlet NSWindow *mainWindow;
	IBOutlet SRRecorderControl *shortcutRecorder;
	
	IBOutlet NSButton *allowedModifiersCommandCheckBox;
	IBOutlet NSButton *allowedModifiersOptionCheckBox;
	IBOutlet NSButton *allowedModifiersShiftCheckBox;
	IBOutlet NSButton *allowedModifiersControlCheckBox;
	
	IBOutlet NSButton *requiredModifiersCommandCheckBox;
	IBOutlet NSButton *requiredModifiersOptionCheckBox;
	IBOutlet NSButton *requiredModifiersShiftCheckBox;
	IBOutlet NSButton *requiredModifiersControlCheckBox;
	
	IBOutlet SRRecorderControl *delegateDisallowRecorder;
	
	IBOutlet NSButton *globalHotKeyCheckBox;
	IBOutlet NSTextView *globalHotKeyLogView;
	
	IBOutlet NSTextField *delegateDisallowReasonField;

	PTHotKey *globalHotKey;
}

- (IBAction)allowedModifiersChanged:(id)sender;
- (IBAction)requiredModifiersChanged:(id)sender;

- (IBAction)toggleGlobalHotKey:(id)sender;

@end
