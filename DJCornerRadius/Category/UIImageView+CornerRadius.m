//
//  UIImageView+CornerRadius.m
//  DJCornerRadius
//
//  Created by lidongjie on 2018/10/16.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import "UIImage+CornerRadius.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (CornerRadius)

- (void)sd_setImageWithURL:(NSURL *)url radius:(CGFloat)radius size:(CGSize)size {
    [self sd_setImageWithURL:url placeholderImage:nil radius:radius size:size];
}

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(CGFloat)radius size:(CGSize)size {
    void (^block)(UIImage *) = ^(UIImage *radiusPlaceholder) {
        [self sd_setImageWithURL:url placeholderImage:radiusPlaceholder options:SDWebImageAvoidAutoSetImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [image dj_addCornerWithRadius:radius size:size completion:^(UIImage * _Nonnull radiusImage) {
                [UIView transitionWithView:self duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction animations:^{
                    self.image = radiusImage;
                } completion:nil];
                [self setNeedsLayout];
            }];
        }];
    };
    if (placeholder) {
        [placeholder dj_addCornerWithRadius:radius size:size completion:^(UIImage * _Nonnull radiusPlaceholder) {
            block(radiusPlaceholder);
        }];
    } else {
        block(nil);
    }
}

- (void)sd_setRoundedImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder {
    void (^block)(UIImage *) = ^(UIImage *radiusPlaceholder) {
        [self sd_setImageWithURL:url placeholderImage:radiusPlaceholder options:SDWebImageAvoidAutoSetImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [image dj_addRoundedCornerWithCompletion:^(UIImage * _Nonnull radiusImage) {
                [UIView transitionWithView:self duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction animations:^{
                    self.image = radiusImage;
                } completion:nil];
                [self setNeedsLayout];
            }];
        }];
    };
    if (placeholder) {
        [placeholder dj_addRoundedCornerWithCompletion:^(UIImage * _Nonnull radiusPlaceholder) {
            block(radiusPlaceholder);
        }];
    } else {
        block(nil);
    }
}

@end
