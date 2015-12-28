//
//  FriendsMomentsModel.h
//  miaoqu_hl
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDYReviewModel.h"

@interface MDYLayoutModel : NSObject

/**
 *  动态发布者的名字
 */
@property (copy, nonatomic) NSString *name;

/**
 *  动态中的文字
 */
@property (copy, nonatomic) NSString *text;

/**
 *  头像
 */
@property (copy, nonatomic) NSString *avator;

/**
 *  动态中附带的图片
 */
@property (copy, nonatomic) NSArray *pics;

/**
 *  评论列表
 */
@property (copy, nonatomic) NSArray *reviews;

/**
 *  点赞的人列表
 */
@property (copy, nonatomic) NSArray *likes;


@end
