//
//  UIImage+CornerRadius.m
//  DJCornerRadius
//
//  Created by lidongjie on 2018/10/16.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "UIImage+CornerRadius.h"

@implementation UIImage (CornerRadius)

- (void)dj_addRoundedCornerWithCompletion:(void (^)(UIImage *image))completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // test time
        NSTimeInterval start = CACurrentMediaTime();
        
        CGFloat squareSize = MIN(self.size.width, self.size.height);
        
        CGRect rect = CGRectMake(0, 0, squareSize, squareSize);
        
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSaveGState(context);
        CGContextAddEllipseInRect(context, rect);
        CGContextClip(context);
        
        CGPoint drawPoint = CGPointMake(-(self.size.width - squareSize) / 2,
                                        -(self.size.height - squareSize) / 2);
        [self drawAtPoint:drawPoint];
        CGContextRestoreGState(context);
        
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSLog(@"----------------%f", CACurrentMediaTime() - start);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(result);
            }
        });
    });
}

#pragma mark -
- (void)dj_addCornerWithRadius:(CGFloat)radius completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:UIRectCornerAllCorners radius:radius border:0 borderColor:nil size:self.size completion:completion];
}

- (void)dj_addCornerWithRadius:(CGFloat)radius size:(CGSize)size completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:UIRectCornerAllCorners radius:radius border:0 borderColor:nil size:size completion:completion];
}

#pragma mark - border
- (void)dj_addCornerWithRadius:(CGFloat)radius border:(CGFloat)border borderColor:(UIColor *)borderColor completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:UIRectCornerAllCorners radius:radius border:border borderColor:borderColor size:self.size completion:completion];
}

- (void)dj_addCornerWithRadius:(CGFloat)radius border:(CGFloat)border borderColor:(UIColor *)borderColor size:(CGSize)size completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:UIRectCornerAllCorners radius:radius border:border borderColor:borderColor size:size completion:completion];
}

#pragma mark - corner
- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius  completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:corner radius:radius border:0 borderColor:nil size:self.size completion:completion];
}

- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius size:(CGSize)size  completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:corner radius:radius border:0 borderColor:nil size:size completion:completion];
}

#pragma mark - corner & border
- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius border:(CGFloat)border borderColor:(UIColor *)borderColor completion:(void (^)(UIImage *image))completion {
    [self dj_addCorner:corner radius:radius border:border borderColor:borderColor size:self.size completion:completion];
}

/**
 Image add corner
 
 @param corner UIRectCorner, Default to UIRectCornerAllCorners
 @param radius radius
 @param border border width
 @param borderColor boder color
 @param size image size
 @param backgroundColor background color
 @return new image
 */
- (void)dj_addCorner:(UIRectCorner)corner radius:(CGFloat)radius border:(CGFloat)border borderColor:(UIColor *)borderColor size:(CGSize)size completion:(void (^)(UIImage *image))completion  {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // test time
        //        NSTimeInterval start = CACurrentMediaTime();
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        [path addClip];
        [self drawInRect:rect];
        
        if (borderColor) {
            [borderColor setStroke];
        }
        if (border > 0) {
            path.lineWidth = border;
            [path stroke];
        }
        
        UIImage * result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //        NSLog(@"----------------%f", CACurrentMediaTime() - start);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(result);
            }
        });
    });
}

@end
