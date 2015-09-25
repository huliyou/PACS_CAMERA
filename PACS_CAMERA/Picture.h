//
//  Picture.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/14.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pictures;

@interface Picture : NSManagedObject

@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) Pictures *pictures;

@end
