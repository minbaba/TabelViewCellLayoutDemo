//
//  MQInterestMomentCell.h
//  miaoqu_hl
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDYLayout.h"


@interface MDYLayoutCell : UITableViewCell

@property (strong, nonatomic) UIButton *avator;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UILabel *readCountLabel;

@property (strong, nonatomic) NSMutableArray *tagArr;

@property (strong, nonatomic) UILabel *messegeLabel;

@property (strong, nonatomic) NSMutableArray *picArr;

@property (strong, nonatomic) UILabel *timeLabel;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIButton *reviewBtn;

@property (strong, nonatomic) UIImageView *reviewBg;


@property (strong, nonatomic) NSMutableArray *likeArr;


@property (strong, nonatomic) NSMutableArray *reviewArr;


@property (strong, nonatomic) MDYLayout *layout;
@end
