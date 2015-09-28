//
//  User+CoreDataProperties.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/28.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *userid;
@property (nullable, nonatomic, retain) NSSet<Pictures *> *picturesList;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addPicturesListObject:(Pictures *)value;
- (void)removePicturesListObject:(Pictures *)value;
- (void)addPicturesList:(NSSet<Pictures *> *)values;
- (void)removePicturesList:(NSSet<Pictures *> *)values;

@end

NS_ASSUME_NONNULL_END
