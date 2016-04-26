//
//  OwnLayout.m
//  WriteSomething
//
//  Created by 罗钰慧 on 16/4/21.
//  Copyright (c) 2016年 罗钰慧. All rights reserved.
//

#import "OwnLayout.h"

@implementation OwnLayout
{
    NSMutableArray *_attributeAttay;
    int _itemCount;
}

- (void)prepareLayout {
    [super prepareLayout];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    _attributeAttay = [NSMutableArray array];
    
    int itemcount1 = (int)[self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < itemcount1; i ++) {
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attris.frame = CGRectMake(10 + ((width - 60) / 5 + 10) * i , 10, (width - 60) / 5, (width - 60) / 5);
        
        [_attributeAttay addObject:attris];
    }
    
    int itemcount2 = (int)[self.collectionView numberOfItemsInSection:1];
    for (int i = 0 ; i < itemcount2; i ++) {
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:1]];
        attris.frame = CGRectMake(0, (width - 60) / 5 + 10,width , 124 - (width - 60) / 5 - 10);
        [_attributeAttay addObject:attris];
    }
    
    _itemCount = (int)[self.collectionView numberOfItemsInSection:2];
    for (int i = 0; i < _itemCount; i++) {
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:2]];
        if (i == 0 ) {
            attris.frame = CGRectMake(10, 134, (width - 20) / 3 * 2 - 3, (width - 20) / 3 * 2);
        } else if(i == 1) {
            attris.frame = CGRectMake((width - 20) / 3 * 2 + 20 - 3, 134, (width - 40) / 3 - 1 , (width - 40) / 3);
        } else if (i == 2) {
            attris.frame = CGRectMake((width - 20) / 3 * 2 + 20 - 3, 20 + (width - 40) / 3 + 2 + 124, (width - 40) / 3 - 1, (width - 40) / 3);
        } else if (i == 3){
            attris.frame = CGRectMake(10 , (width - 20) / 3 * 2 + 20 + 124, (width - 40) / 3, (width - 40) / 3);
        } else if (i == 4){
            attris.frame = CGRectMake(20 + (width - 40) / 3 , (width - 20) / 3 * 2 + 20 + 124, (width - 40) / 3, (width - 40) / 3);
        }  else if (i == 5){
            attris.frame = CGRectMake(30 + (width - 40) / 3 * 2 , (width - 20) / 3 * 2 + 20 + 124, (width - 40) / 3, (width - 40) / 3);
        } else if (i == 6) {
            attris.frame = CGRectMake(10 , (width - 20) / 3 * 2 + 20 + 10 + (width - 40) / 3 + 124, (width - 40) / 3, (width - 40) / 3);

        } else if (i == 7) {
            attris.frame = CGRectMake(20 + (width - 40) / 3 , (width - 20) / 3 * 2 + 20 + 10 + (width -40) / 3 + 124, (width - 40) / 3, (width - 40) / 3);

        } else {
             attris.frame = CGRectMake(30 + (width - 40) / 3 * 2 , (width - 20) / 3 * 2 + 20 + 10 + (width - 40) / 3 + 124, (width - 40) / 3, (width - 40) / 3);
        }
        
       
        [_attributeAttay addObject:attris];
        
    }
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeAttay;
}
@end
