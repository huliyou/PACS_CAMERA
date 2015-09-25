//
//  User.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/17.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pictures;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSSet *picturesList;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addPicturesListObject:(Pictures *)value;
- (void)removePicturesListObject:(Pictures *)value;
- (void)addPicturesList:(NSSet *)values;
- (void)removePicturesList:(NSSet *)values;

@end
