//
//  ConditionInit.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/28.
//  Copyright © 2015年 Leiyou Who. All rights reserved.
//

#import "ConditionInit.h"
#import "AFNetworking.h"

@implementation ConditionInit
+ (void)getAndSetConditionSegement:(UISegmentedControl *)segment {
    NSArray *segmentTitles;
    
    // get segment content from web service
    segmentTitles = [ConditionInit getSementTitlesFromWebService];
    
    // get segment content from local storage
    if (!segmentTitles) {
        segmentTitles = [ConditionInit getSementTitlesFromLocalStorage];
    }
    
    [segment removeAllSegments];
    for (int i = 0; i < [segmentTitles count]; i++) {
        [segment insertSegmentWithTitle:segmentTitles[i] atIndex:i animated:NO];
    }
    [segment setSelectedSegmentIndex:0];
}
+ (NSArray *)getSementTitlesFromWebService {
    __block NSArray *arr = [[NSArray alloc] init];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *param = @{@"method":@"condition"};
    [manager GET:@"" parameters:param success:^(AFHTTPRequestOperation *operation, id responseData){
        NSError *jsonError;
        arr = [NSJSONSerialization JSONObjectWithData:responseData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
        //TODO: 跟本地的进行比较， 更新
    
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        arr = [ConditionInit getSementTitlesFromLocalStorage];
    }];
    
    //FIXME: delete after web service is work.
    arr = @[@"1",@"2",@"3"];
    return arr;
}
+ (NSArray *)getSementTitlesFromLocalStorage {
    NSArray *arr = [[NSArray alloc] init];
    arr = @[@"1",@"2",@"3"];
    return arr;
}
@end
