//
//  TrollScrollImageView.h
//  OSSDemo
//
//  Created by Troll on 16/1/14.
//  Copyright © 2016年 Troll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrollScrollImageView : UIImageView

@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, assign) CGFloat scrollDistance;
@property (nonatomic, assign) CGFloat scrollStep;


- (void)scrollImageToTop;
- (void)scrollImageToBottom;



@end
