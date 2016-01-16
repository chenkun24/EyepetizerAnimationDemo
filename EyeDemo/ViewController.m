//
//  ViewController.m
//  EyeDemo
//
//  Created by C.K on 1/14/16.
//  Copyright © 2016 chenkun. All rights reserved.
//

#import "ViewController.h"
#import "EyeCollectionViewCell.h"

#define EyeCellIdentifier @"EyeCellIdentifier"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *colView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = @[@"hzw01.png", @"hzw02.png", @"hzw03.png", @"hzw04.png", @"hzw05.png"];
}

- (UICollectionView *)colView
{
    if (!_colView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(200, 300);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _colView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 300) collectionViewLayout:layout];
        _colView.pagingEnabled = YES;
        _colView.delegate = self;
        _colView.dataSource = self;
        [_colView registerClass:[EyeCollectionViewCell class] forCellWithReuseIdentifier:EyeCellIdentifier];
        [self.view addSubview:_colView];
    }
    
    return _colView;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.colView.center = self.view.center;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}
 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EyeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:EyeCellIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[self.data objectAtIndex:indexPath.row]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UICollectionView *view = (UICollectionView *)scrollView;
    NSInteger index = view.contentOffset.x / view.frame.size.width + 1;

    CGFloat offsetLeft = - (view.contentOffset.x - (index) * view.frame.size.width);
    if (offsetLeft > 0)
    {
        if (index > 0 && index < self.data.count)
        {   
            EyeCollectionViewCell *cleft = (EyeCollectionViewCell *)[view cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index - 1 inSection:0]];
            [cleft left:offsetLeft];
            
            EyeCollectionViewCell *cmid = (EyeCollectionViewCell *)[view cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
            [cmid middleLeft:offsetLeft];
        }
    }
    else if (offsetLeft < 0)
    {
        if (index < self.data.count - 1)
        {
            
            EyeCollectionViewCell *cright = (EyeCollectionViewCell *)[view cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index+1 inSection:0]];
            [cright right:-offsetLeft];
            
            EyeCollectionViewCell *cmid = (EyeCollectionViewCell *)[view cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
            [cmid middleRight:-offsetLeft];
        }
    }
}

@end
