//
//  Pictures.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/14.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Picture, User;

@interface Pictures : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSSet *imageDataList;
@end

@interface Pictures (CoreDataGeneratedAccessors)

- (void)addImageDataListObject:(Picture *)value;
- (void)removeImageDataListObject:(Picture *)value;
- (void)addImageDataList:(NSSet *)values;
- (void)removeImageDataList:(NSSet *)values;

@end
