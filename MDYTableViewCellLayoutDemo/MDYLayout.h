//
//  MQInterestMomentLayout.h
//  miaoqu_hl
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDYLayoutModel.h"
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@interface MDYLayout : NSObject

@property (strong, nonatomic) MDYLayoutModel *model;

@property (assign, nonatomic) CGRect avatorRect;

@property (assign, nonatomic) CGRect nameLabelRect;

@property (assign, nonatomic) CGRect readCountRect;

@property (assign, nonatomic) CGRect messegeRect;

@property (copy, nonatomic) NSArray *picRectArr;

@property (assign, nonatomic) CGRect timeRect;

@property (assign, nonatomic) CGRect likeBtnRect;

@property (assign, nonatomic) CGRect reviewBtnRect;

@property (assign, nonatomic) CGRect reviewBgRect;

@property (copy, nonatomic) NSArray *likeAvatorRectArr;

@property (copy, nonatomic) NSArray *reviewRectArr;

@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGFloat contentWidth;



@property (copy, nonatomic) NSMutableAttributedString *reviewStr;


+ (instancetype)layoutWithMoment:(MDYLayoutModel *)moment;

@end
