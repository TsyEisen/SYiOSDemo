//
//  ERFloatView.h
//  ERPackage
//
//  Created by leju_esf on 16/5/23.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERFloatView : UIView
/**
 *  小按钮的点击的事件
 */
@property (nonatomic, copy) void (^action)(NSInteger index);
/**
 *  构造方法
 *
 *  @param titles 小按钮的标题数组
 *  @param frame  大按钮的frame
 *
 *  @return 浮层View
 */
- (instancetype)initWithTitles:(NSArray *)titles andFrame:(CGRect)frame;

/**
 *  收回按钮
 */
- (void)dismissBtn;
@end
