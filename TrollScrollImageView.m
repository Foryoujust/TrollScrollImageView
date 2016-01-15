//
//  TrollScrollImageView.m
//  OSSDemo
//
//  Created by Troll on 16/1/14.
//  Copyright © 2016年 Troll. All rights reserved.
//

#import "TrollScrollImageView.h"

@interface TrollScrollImageView ()

@property (nonatomic, assign) CGRect lastRect;

@end

@implementation TrollScrollImageView

- (void)setScrollDistance:(CGFloat)scrollDistance{
    _scrollDistance = scrollDistance;
    UIImage *image = [self clipImageWithTop:_scrollDistance];
    self.image = image;
}

- (UIImage *)clipImageWithTop:(CGFloat)top{
    NSAssert(_originalImage, @"%@: originalImage can't be nil",[self class]);
    CGRect rect = CGRectMake(0, top, _originalImage.size.width, _originalImage.size.height-2*_scrollDistance);
    _lastRect = rect;
    CGImageRef imageRef = CGImageCreateWithImageInRect([_originalImage CGImage], rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    return image;
}

- (void)scrollImageToTop{
    CGFloat y = _lastRect.origin.y-_scrollStep;
    if(y <= 0){
        y = 0;
    }
    
    UIImage *image = [self clipImageWithTop:y];
    self.image = image;
}

- (void)scrollImageToBottom{
    CGFloat y = _lastRect.origin.y+_scrollStep;
    
    if(y >= _scrollDistance*2){
        y = _scrollDistance*2;
    }
    
    UIImage *image = [self clipImageWithTop:y];
    self.image = image;
}



@end
