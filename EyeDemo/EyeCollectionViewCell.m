//
//  EyeCollectionViewCell.m
//  EyeDemo
//
//  Created by C.K on 1/16/16.
//  Copyright © 2016 chenkun. All rights reserved.
//

#import "EyeCollectionViewCell.h"

@implementation EyeCollectionViewCell

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    self.clipsToBounds = YES;
}

- (void)left:(CGFloat)offset
{
    CGRect fr = self.bounds;
    CGFloat start = 0.75 * fr.size.width;
    
    fr.origin.x = start - offset / fr.size.width * start;
    self.imageView.frame = fr;
}

- (void)right:(CGFloat)offset
{
    CGRect fr = self.bounds;
    CGFloat start = - 0.75 * fr.size.width;
    
    fr.origin.x = start - offset / fr.size.width * start;
    self.imageView.frame = fr;
}

- (void)middleLeft:(CGFloat)offset
{
    CGRect fr = self.bounds;
    fr.origin.x = - offset * 0.75;
    self.imageView.frame = fr;
}

- (void)middleRight:(CGFloat)offset
{
    CGRect fr = self.bounds;
    fr.origin.x = offset * 0.75;
    self.imageView.frame = fr;
}

@end
