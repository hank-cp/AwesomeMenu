//
//  AwesomeMenu.h
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 Levey & Other Contributors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AwesomeMenuItem.h"

enum AWECOME_MENU_ITEM_DIRECTION {
    AWECOME_MENU_ITEM_DIRECTION_CLICKWISE = 1,
    AWECOME_MENU_ITEM_DIRECTION_ANTI_CLICKWISE = -1,
};

@protocol AwesomeMenuDelegate;


@interface AwesomeMenu : UIView <AwesomeMenuItemDelegate>
{
    NSArray *_menusArray;
    int _flag;
    NSTimer *_timer;
    AwesomeMenuItem *_addButton;
    
    id<AwesomeMenuDelegate> _delegate;
    BOOL _isAnimating;
}
@property (nonatomic, copy) NSArray *menusArray;
@property (nonatomic, getter = isExpanding) BOOL expanding;
@property (nonatomic, assign) id<AwesomeMenuDelegate> delegate;

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *highlightedImage;
@property (nonatomic, retain) UIImage *contentImage;
@property (nonatomic, retain) UIImage *highlightedContentImage;

@property (nonatomic, assign) CGFloat nearRadius;
@property (nonatomic, assign) CGFloat endRadius;
@property (nonatomic, assign) CGFloat farRadius;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGFloat timeOffset;
@property (nonatomic, assign) CGFloat rotateAngle;
@property (nonatomic, assign) CGFloat menuWholeAngle;
@property (nonatomic, assign) CGFloat expandRotation;
@property (nonatomic, assign) CGFloat closeRotation;
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) enum AWECOME_MENU_ITEM_DIRECTION direction;

- (id)initWithFrame:(CGRect)frame menus:(NSArray *)aMenusArray;
@end

@protocol AwesomeMenuDelegate <NSObject>
- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx;
@end