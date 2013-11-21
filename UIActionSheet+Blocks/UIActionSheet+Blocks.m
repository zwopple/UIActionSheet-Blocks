#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

static void *completionHandlerKey = &completionHandlerKey;

@implementation UIActionSheet (Blocks)

#pragma mark - Properties

@dynamic completionHandler;

- (void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
    return objc_getAssociatedObject(self, completionHandlerKey);
}
- (void)setCompletionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
    objc_setAssociatedObject(self, completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Initialization

+ (instancetype)actionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitle, ... {
    UIActionSheet *as = [[self alloc] initWithTitle:title
                                           delegate:nil
                                  cancelButtonTitle:nil
                             destructiveButtonTitle:nil
                                  otherButtonTitles:nil];
    
    if(destructiveButtonTitle) {
        as.destructiveButtonIndex = [as addButtonWithTitle:destructiveButtonTitle];
    }
    
    if(otherButtonTitle) {
        [as addButtonWithTitle:otherButtonTitle];
        
        va_list args;
        va_start(args, otherButtonTitle);
        while((otherButtonTitle = va_arg(args, id)) != nil) {
            [as addButtonWithTitle:otherButtonTitle];
        }
        va_end(args);
    }
    
    if(cancelButtonTitle) {
        as.cancelButtonIndex = [as addButtonWithTitle:cancelButtonTitle];
    }
    
    return as;
}

#pragma mark - Actions

- (void)showFromTabBar:(UITabBar *)tabBar completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on UIActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	self.completionHandler = completionHandler;
	[self showFromTabBar:tabBar];
}
- (void)showFromToolbar:(UIToolbar *)toolBar completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on UIActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	self.completionHandler = completionHandler;
	[self showFromToolbar:toolBar];
}
- (void)showInView:(UIView *)view completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on UIActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	self.completionHandler = completionHandler;
	[self showInView:view];
}
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on UIActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	self.completionHandler = completionHandler;
	[self showFromBarButtonItem:item animated:animated];
}
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler {
	if(self.delegate != nil) {
		NSLog(@"WARNING: resetting delegate on UIActionSheet because completion handler will be used.");
	}
	self.delegate = (id <UIActionSheetDelegate>)self;
	self.completionHandler = completionHandler;
	[self showFromRect:rect inView:view animated:animated];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(self.completionHandler) {
		self.completionHandler(self, buttonIndex);
	}
}

@end
