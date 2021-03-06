//
//  SAMClockConfigureWindowController.m
//  Clock
//
//  Created by Sam Soffes on 3/11/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "SAMClockConfigureWindowController.h"
#import "SAMClockView.h"

#import <ScreenSaver/ScreenSaver.h>

@implementation SAMClockConfigureWindowController

- (NSString *)windowNibName {
	return @"SAMClockConfiguration";
}


- (void)awakeFromNib {
	[super awakeFromNib];

	ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:SAMClockDefaultsModuleName];
	[self.stylePicker selectItemAtIndex:[defaults integerForKey:SAMClockStyleDefaultsKey]];
	self.tickMarksCheckbox.state = [defaults boolForKey:SAMClockTickMarksDefaultsKey];
	self.numbersCheckbox.state = [defaults boolForKey:SAMClockNumbersDefaultsKey];
	self.dateCheckbox.state = [defaults boolForKey:SAMClockDateDefaultsKey];
	self.logoCheckbox.state = [defaults boolForKey:SAMClockLogoDefaultsKey];
}


- (IBAction)close:(id)sender {
	[NSApp endSheet:self.window];
}


- (IBAction)changeStyle:(id)sender {
	ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:SAMClockDefaultsModuleName];
	[defaults setInteger:[self.stylePicker indexOfSelectedItem] forKey:SAMClockStyleDefaultsKey];
	[defaults synchronize];

	[[NSNotificationCenter defaultCenter] postNotificationName:SAMClockConfigurationDidChangeNotificationName object:nil];
}


- (IBAction)changeTickMarks:(id)sender {
	ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:SAMClockDefaultsModuleName];
	[defaults setBool:[self.tickMarksCheckbox state] forKey:SAMClockTickMarksDefaultsKey];
	[defaults synchronize];

	[[NSNotificationCenter defaultCenter] postNotificationName:SAMClockConfigurationDidChangeNotificationName object:nil];
}


- (IBAction)changeNumbers:(id)sender; {
	ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:SAMClockDefaultsModuleName];
	[defaults setBool:[self.numbersCheckbox state] forKey:SAMClockNumbersDefaultsKey];
	[defaults synchronize];

	[[NSNotificationCenter defaultCenter] postNotificationName:SAMClockConfigurationDidChangeNotificationName object:nil];
}


- (IBAction)changeDate:(id)sender {
	ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:SAMClockDefaultsModuleName];
	[defaults setBool:[self.dateCheckbox state] forKey:SAMClockDateDefaultsKey];
	[defaults synchronize];

	[[NSNotificationCenter defaultCenter] postNotificationName:SAMClockConfigurationDidChangeNotificationName object:nil];
}


- (IBAction)changeLogo:(id)sender {
	ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:SAMClockDefaultsModuleName];
	[defaults setBool:[self.logoCheckbox state] forKey:SAMClockLogoDefaultsKey];
	[defaults synchronize];

	[[NSNotificationCenter defaultCenter] postNotificationName:SAMClockConfigurationDidChangeNotificationName object:nil];
}

@end
