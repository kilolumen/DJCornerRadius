//
//  UIImage+CornerRadius.h
//  DJCornerRadius
//
//  Created by lidongjie on 2018/10/16.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CornerRadius)

- (void)dj_addRoundedCornerWithCompletion:(void (^)(UIImage *image))completion;

#pragma mark -
- (void)dj_addCornerWithRadius:(CGFloat)radius completion:(void (^)(UIImage *image))completion;

- (void)dj_addCornerWithRadius:(CGFloat)radius size:(CGSize)size completion:(void (^)(UIImage *image))completion;

#pragma mark - border
- (void)dj_addCornerWithRadius:(CGFloat)radius border:(CGFloat)border borderColor:(nullable UIColor *)borderColor completion:(void (^)(UIImage *image))completion;

- (void)dj_addCornerWithRadius:(CGFloat)radius border:(CGFloat)border borderColor:(nullable UIColor *)borderColor size:(CGSize)size completion:(void (^)(UIImage *image))completion;

#pragma mark - corner
- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius completion:(void (^)(UIImage *image))completion;

- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius size:(CGSize)size completion:(void (^)(UIImage *image))completion;

#pragma mark - corner & border
- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius border:(CGFloat)border borderColor:(nullable UIColor *)borderColor completion:(void (^)(UIImage *image))completion;

/**
 Image add corner
 
 @param corner UIRectCorner, Default to UIRectCornerAllCorners
 @param radius radius
 @param border border width
 @param borderColor boder color
 @param size image size
 @return new image
 */
- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius border:(CGFloat)border borderColor:(nullable UIColor *)borderColor size:(CGSize)size completion:(void (^)(UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
