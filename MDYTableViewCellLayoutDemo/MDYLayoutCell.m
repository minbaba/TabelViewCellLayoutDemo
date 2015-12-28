//
//  MQInterestMomentCell.m
//  miaoqu_hl
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MDYLayoutCell.h"
#import "MDYFactory.h"

@implementation MDYLayoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _avator = [UIButton buttonWithType:UIButtonTypeCustom];
        _avator.layer.cornerRadius = 5;
        _avator.layer.masksToBounds = YES;
        
        _nameLabel = [MDYFactory labelWithFontSize:14 andNumberOfLines:1];
        _nameLabel.textColor = [UIColor blackColor];
        
        _readCountLabel = [MDYFactory labelWithFontSize:12 andNumberOfLines:1];
        _readCountLabel.textColor = [UIColor grayColor];
        
        _messegeLabel = [MDYFactory labelWithFontSize:14 andNumberOfLines:0];
        _messegeLabel.textColor = [UIColor blackColor];
        
        _timeLabel = [MDYFactory labelWithFontSize:12 andNumberOfLines:1];
        _timeLabel.textColor = [UIColor grayColor];
        
        _likeBtn = [MDYFactory ButtonWithType:UIButtonTypeCustom andImage:[UIImage imageNamed:@"icon_赞"] andTittle:@"100" andFontSize:12];
        [_likeBtn setTitleColor:[UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1] forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"icon_sel_赞"] forState:UIControlStateSelected];
        [_likeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        _reviewBtn = [MDYFactory ButtonWithType:UIButtonTypeCustom andImage:[UIImage imageNamed:@"icon_评论"] andTittle:@"10" andFontSize:12];
        [_reviewBtn setTitleColor:[UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1] forState:UIControlStateNormal];
        [_reviewBtn setImage:[UIImage imageNamed:@"icon_sel_评论"] forState:UIControlStateSelected];
        [_reviewBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        _reviewBg = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"评论区背景"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 50, 5, 5)]];
        
        [self.contentView addSubview:_avator];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_readCountLabel];
        [self.contentView addSubview:_messegeLabel];
        [self.contentView addSubview:_timeLabel];
        [self.contentView addSubview:_likeBtn];
        [self.contentView addSubview:_reviewBtn];
        [self.contentView addSubview:_reviewBg];
        
        _tagArr = [NSMutableArray array];
        _picArr = [NSMutableArray array];
        _likeArr = [NSMutableArray array];
        _reviewArr = [NSMutableArray array];
    }
    
    
    return self;
}

- (void)initUI {
    
    NSArray *arr = @[_tagArr, _picArr, _likeArr, _reviewArr];
    for (NSArray *subArr in arr) {
        for (UIView *view in subArr) {
            [view removeFromSuperview];
        }
    }
}

- (void)setLayout:(MDYLayout *)layout {
    
    _layout = layout;
    
    [self initUI];
    
    _avator.frame = layout.avatorRect;
    [_avator setBackgroundImage:[UIImage imageNamed:layout.model.avator] forState:UIControlStateNormal];
    
    _nameLabel.frame = layout.nameLabelRect;
    _nameLabel.text = layout.model.name;
    
    _readCountLabel.frame = layout.readCountRect;
    _readCountLabel.text = @"100次浏览";
    
    _messegeLabel.frame = layout.messegeRect;
    _messegeLabel.text = layout.model.text;
    
    [self setUpPicContent];
    
    _timeLabel.frame = layout.timeRect;
    _timeLabel.text = @"2分钟前";
    
    _likeBtn.frame = layout.likeBtnRect;
    
    _reviewBtn.frame = layout.reviewBtnRect;
    
    [self setUpReviewContent];
    
    _reviewBg.frame = _layout.reviewBgRect;
}

- (void)setUpPicContent {
    for (int i = 0; i < _layout.picRectArr.count; i++) {
        
        UIImageView *iv;
        if (i < _picArr.count) {
            iv = _picArr[i];
        } else {
            iv = [[UIImageView alloc] init];
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.layer.masksToBounds = YES;
            
            [_picArr addObject:iv];
        }
        
        iv.frame = CGRectFromString(_layout.picRectArr[i]);
        [self.contentView addSubview:iv];
        
        iv.image = [UIImage imageNamed:_layout.model.pics[i]];
    }
}

- (void)setUpReviewContent {
    for (int i = 0; i < _layout.reviewRectArr.count; i++) {
        
        UILabel *label;
        if (i < _reviewArr.count) {
            label = _reviewArr[i];
        } else {
            label = [MDYFactory labelWithFontSize:14 andNumberOfLines:0];
            [_reviewArr addObject:label];
        }
        
        label.frame = CGRectFromString(_layout.reviewRectArr[i]);
        [self.contentView addSubview:label];
        
        label.attributedText = _layout.reviewStr;
    }
}



@end
