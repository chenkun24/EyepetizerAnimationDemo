//
//  EyeCollectionViewCell.h
//  EyeDemo
//
//  Created by C.K on 1/16/16.
//  Copyright © 2016 chenkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EyeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

- (void)left:(CGFloat)offset;
- (void)right:(CGFloat)offset;
- (void)middleLeft:(CGFloat)offset;
- (void)middleRight:(CGFloat)offset;

@end
