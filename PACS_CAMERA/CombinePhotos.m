//
//  CombinePhotos.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/29.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//

#import "CombinePhotos.h"
#import "Picture.h"

@implementation CombinePhotos

+ (UIImage *)getPhotoSliceWithPictures:(Pictures *)pictures {
    if ([pictures.imageDataList count] == 0) {
        //
        return [[UIImage alloc] init];
    }
    CGSize size = CGSizeMake(62, 62);
    UIGraphicsBeginImageContext(size);
    NSSortDescriptor * sortByTag = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    NSArray *imageArr = [[pictures.imageDataList sortedArrayUsingDescriptors:@[sortByTag]] mutableCopy];
    if ([pictures.imageDataList count] == 1) {
        UIImage *image1 = [UIImage imageWithData:((Picture *)imageArr[0]).imageData];
        [image1 drawInRect:CGRectMake(0, 0, 62, 62)];
    }else if ([pictures.imageDataList count] == 2) {
        UIImage *image1 = [UIImage imageWithData:((Picture *)imageArr[0]).imageData];
        UIImage *image2 = [UIImage imageWithData:((Picture *)imageArr[1]).imageData];
        [image1 drawInRect:CGRectMake(0, 0, 62/2, 62)];
        [image2 drawInRect:CGRectMake(62/2, 0, 62/2, 62)];
    }else if ([pictures.imageDataList count] == 3) {
        UIImage *image1 = [UIImage imageWithData:((Picture *)imageArr[0]).imageData];
        UIImage *image2 = [UIImage imageWithData:((Picture *)imageArr[1]).imageData];
        UIImage *image3 = [UIImage imageWithData:((Picture *)imageArr[2]).imageData];
        [image1 drawInRect:CGRectMake(0, 0, 62/2, 62/2)];
        [image2 drawInRect:CGRectMake(62/2, 0, 62/2, 62/2)];
        [image3 drawInRect:CGRectMake(0, 62/2, 62/2, 62/2)];
    }else if ([pictures.imageDataList count] >= 4) {
        UIImage *image1 = [UIImage imageWithData:((Picture *)imageArr[0]).imageData];
        UIImage *image2 = [UIImage imageWithData:((Picture *)imageArr[1]).imageData];
        UIImage *image3 = [UIImage imageWithData:((Picture *)imageArr[2]).imageData];
        UIImage *image4 = [UIImage imageWithData:((Picture *)imageArr[3]).imageData];
        [image1 drawInRect:CGRectMake(0, 0, 62/2, 62/2)];
        [image2 drawInRect:CGRectMake(62/2, 0, 62/2, 62/2)];
        [image3 drawInRect:CGRectMake(0, 62/2, 62/2, 62/2)];
        [image4 drawInRect:CGRectMake(62/2, 62/2, 62/2, 62/2)];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
