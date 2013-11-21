#import <UIKit/UIKit.h>

@interface UIActionSheet (Blocks)

#pragma mark - Properties

@property (nonatomic, copy) void (^completionHandler)(UIActionSheet *actionSheet, NSInteger buttonIndex);

#pragma mark - Initialization

+ (instancetype)actionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitle, ... NS_REQUIRES_NIL_TERMINATION;

#pragma mark - Actions

- (void)showFromTabBar:(UITabBar *)tabBar completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showFromToolbar:(UIToolbar *)toolBar completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showInView:(UIView *)view completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(void (^)(UIActionSheet *actionSheet, NSInteger buttonIndex))completionHandler;

@end
