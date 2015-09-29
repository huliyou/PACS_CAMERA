//
//  CombinePhotos.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/29.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Pictures.h"

@interface CombinePhotos : NSObject
+ (UIImage *)getPhotoSliceWithPictures:(Pictures *)pictures;
@end
