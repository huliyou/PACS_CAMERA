//
//  Pictures+CoreDataProperties.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/28.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pictures.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pictures (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *patientid;
@property (nullable, nonatomic, retain) NSString *conditionid;
@property (nullable, nonatomic, retain) NSSet<Picture *> *imageDataList;
@property (nullable, nonatomic, retain) User *user;

@end

@interface Pictures (CoreDataGeneratedAccessors)

- (void)addImageDataListObject:(Picture *)value;
- (void)removeImageDataListObject:(Picture *)value;
- (void)addImageDataList:(NSSet<Picture *> *)values;
- (void)removeImageDataList:(NSSet<Picture *> *)values;

@end

NS_ASSUME_NONNULL_END
