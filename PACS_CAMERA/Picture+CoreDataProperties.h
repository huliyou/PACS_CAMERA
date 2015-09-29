//
//  Picture+CoreDataProperties.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/29.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Picture.h"

NS_ASSUME_NONNULL_BEGIN

@interface Picture (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSNumber *tag;
@property (nullable, nonatomic, retain) Pictures *pictures;

@end

NS_ASSUME_NONNULL_END
