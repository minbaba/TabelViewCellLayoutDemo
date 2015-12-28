//
//  MQReviewModel.h
//  miaoqu_hl
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDYReviewModel : NSObject

/**
 *  评论者的名字
 */
@property (copy, nonatomic) NSString *name;

/**
 *  评论的内容
 */
@property (copy, nonatomic) NSString *text;


@end
