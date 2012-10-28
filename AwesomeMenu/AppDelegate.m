//
//  AppDelegate.m
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 Levey & Other Contributors. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-actionitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-actionitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];

    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, nil];
    [starMenuItem1 release];
    [starMenuItem2 release];
    [starMenuItem3 release];

    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.window.bounds menus:menus];
    
	// customize menu
	/*
	menu.rotateAngle = M_PI/3;
	menu.menuWholeAngle = M_PI;
	menu.timeOffset = 0.2f;
	menu.farRadius = 180.0f;
	menu.endRadius = 100.0f;
	menu.nearRadius = 50.0f;
	*/
    menu.offset = 0.5f;
    menu.direction = AWECOME_MENU_ITEM_DIRECTION_ANTI_CLICKWISE;
	
    menu.delegate = self;
    [self.window addSubview:menu];
    [menu release];
    
    [self.window makeKeyAndVisible];
    return YES;
}


/* ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ */
/* ⬇⬇⬇⬇⬇⬇ GET RESPONSE OF MENU ⬇⬇⬇⬇⬇⬇ */
/* ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ */

- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
}

@end
