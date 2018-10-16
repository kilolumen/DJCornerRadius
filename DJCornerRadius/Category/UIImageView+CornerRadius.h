//
//  UIImageView+CornerRadius.h
//  DJCornerRadius
//
//  Created by lidongjie on 2018/10/16.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (CornerRadius)

- (void)sd_setImageWithURL:(nullable NSURL *)url radius:(CGFloat)radius size:(CGSize)size;

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder radius:(CGFloat)radius size:(CGSize)size;

- (void)sd_setRoundedImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder;

@end

NS_ASSUME_NONNULL_END
