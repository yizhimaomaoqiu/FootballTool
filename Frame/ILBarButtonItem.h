//
// ILBarButtonItem.h
// Version 1.0
// Created by Isaac Lim (isaacl.net) on 1/1/13.
//


#import <UIKit/UIKit.h>

@interface ILBarButtonItem : UIBarButtonItem {
    UIImage *customImage;
    UIImage *customSelectedImage;
    SEL customAction;
}

+ (ILBarButtonItem *)barItemWithImage:(UIImage*)image
                        selectedImage:(UIImage*)selectedImage
                               target:(id)target
                               action:(SEL)action;

- (void)setCustomImage:(UIImage *)image;
- (void)setCustomSelectedImage:(UIImage *)image;

- (void)setCustomAction:(SEL)action;

@end
