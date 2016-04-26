//
//  WaterFallViewController.m
//  WriteSomething
//
//  Created by 罗钰慧 on 16/4/20.
//  Copyright (c) 2016年 罗钰慧. All rights reserved.
//

#import "WaterFallViewController.h"
#import "OwnLayout.h"

@interface WaterFallViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *imagesArr;
@property (nonatomic,strong)NSMutableArray *bigImagesArr;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIView *headerView;
@end

@implementation WaterFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    self.imagesArr = [NSMutableArray array];
    self.bigImagesArr = [NSMutableArray array];
    for (int i = 1; i < 9; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.imagesArr addObject:image];
    }
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    [self.imagesArr addObject:img];
    
    for (int i = 1; i < 6; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.bigImagesArr addObject:image];
    }
    OwnLayout *layout = [[OwnLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 16, width, height - 16) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [self.view addSubview:self.collectionView];

    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    } else if (section == 1) {
        return 1;
    }
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    if (indexPath.section == 0) {
        float num = cell.contentView.frame.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(num / 6, 0, num / 3 * 2, num / 3 * 2)];
        imageView.layer.cornerRadius = num / 3;
        imageView.layer.masksToBounds = YES;
        imageView.image = [self.bigImagesArr objectAtIndex:indexPath.row];
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, num / 3 * 2, num, num / 3)];
        label.text = @"串串";
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:label];
    }else if (indexPath.section == 1) {
        UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5,width, 0.5)];
        line1.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line1];
        
        UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 11, width, 0.5)];
        line2.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line2];
        
        UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(width / 5 * 2, 17 + 9, width / 5, 0.5)];
        line3.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line3];
        
        UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(width / 5 * 2 + width / 5 / 3 - 1, 17 - width / 5 / 3 / 2 + 9, width / 5 / 3 + 2, width / 5 / 3 + 2)];
        imgview.layer.cornerRadius = width / 5 / 3 / 2 + 1;
        imgview.layer.masksToBounds = YES;
        imgview.image = [UIImage imageNamed:@"1.jpg"];
        [cell.contentView addSubview:imgview];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 17 + width / 5 / 3 / 2 + 3 + 5, width, 124 - (width - 60) / 5 - 10 - (17 + width / 5 / 3 / 2) - 5)];
        label.text = @"提提精选";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:label];
      }else {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
        imgView.image = [self.imagesArr objectAtIndex:indexPath.row];
        [cell.contentView addSubview:imgView];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    if (indexPath.section == 0) {
        return CGSizeMake((width - 60) / 5, (width - 60) / 5);
    }else if (indexPath.section == 1) {
        return CGSizeMake(width, 124 - (width - 60) / 5 - 10);
     }else {
        if (indexPath.row == 0) {
            return CGSizeMake((width - 30) / 3 * 2, (width - 30) / 3 * 2);
        } else if (indexPath.row == 1 || indexPath.row == 2) {
            return CGSizeMake((width - 40) / 3, (width - 40) / 3);
        } else {
            return CGSizeMake((width - 40) / 3, (width - 40) / 3);
        }
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsMake(10, 10, 10, 10);

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld            %ld",(long)indexPath.section,(long)indexPath.row);
}








@end
