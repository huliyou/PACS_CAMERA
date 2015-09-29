//
//  Condition+CoreDataProperties.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/28.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Condition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Condition (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *conditionid;
@property (nullable, nonatomic, retain) NSString *conditionName;

@end

NS_ASSUME_NONNULL_END
