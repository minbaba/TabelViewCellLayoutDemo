//
//  MQInterestMomentLayout.m
//  miaoqu_hl
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MDYLayout.h"

@implementation MDYLayout


- (instancetype)initWithMoment:(MDYLayoutModel *)moment {
    
    self = [super init];
    if (self) {
        
        _model = moment;
        
        _contentWidth = SCREEN_WIDTH - 89;
        
        _avatorRect = CGRectMake(12, 10, 50, 50);
        _nameLabelRect = CGRectMake(CGRectGetMaxX(_avatorRect) +15, _avatorRect.origin.y, _contentWidth - 50, 20);
        _readCountRect = CGRectMake(CGRectGetMaxX(_nameLabelRect), _avatorRect.origin.y, 50, 20);
        
        [self layoutMessege];
        
        if (_model.pics) {
            
            [self layoutPics];
            
        }
        
        [self layoutInfoView];
        
        [self layoutReviewView];
        
    }
    return self;
}



- (void)layoutMessege {
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:_model.text];
    
    NSRange allRange = [_model.text rangeOfString:_model.text];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:14.0]
                    range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor blackColor]
                    range:allRange];
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    _messegeRect = [attrStr boundingRectWithSize:CGSizeMake(_contentWidth, MAXFLOAT)
                                        options:options
                                        context:nil];
    _messegeRect.origin.x = _nameLabelRect.origin.x;
    
    _messegeRect.origin.y = CGRectGetMaxY(_nameLabelRect) +20;
}

- (void)layoutPics {
    
    NSMutableArray *mArr = [NSMutableArray array];
    CGFloat pic_widht = (_contentWidth - 10) /3.0f;
    CGFloat pic_height = pic_widht /185.0f *165;
    for (int i = 0; i< _model.pics.count && i< 3; i++)
        [mArr addObject:NSStringFromCGRect(CGRectMake(_nameLabelRect.origin.x +( 5 +pic_widht) *i, CGRectGetMaxY(_messegeRect) +10, pic_widht, pic_height))];
    
    _picRectArr = [mArr copy];
    
}

- (void)layoutInfoView {
    
    CGRect rect = _picRectArr.count? CGRectFromString(_picRectArr[0]): _messegeRect;
    CGFloat y = _picRectArr.count? CGRectGetMaxY(rect) +7.5f: CGRectGetMaxY(rect) +17.5f;
    
    _reviewBtnRect = CGRectMake(SCREEN_WIDTH - 72, y, 60, 25);
    
    _likeBtnRect = CGRectMake(_reviewBtnRect.origin.x - 75, y, 60, 25);
    
    _timeRect = CGRectMake(_nameLabelRect.origin.x, y -7.5f, _contentWidth - 135, 40);
    
}

- (void)layoutReviewView {
    
    if (_model.likes &&_model.likes.count) {
        
        NSMutableArray *mArr = [NSMutableArray array];
        for (int i = 0; i < _model.pics.count; i++) {
            
            CGRect rect = CGRectMake(_nameLabelRect.origin.x +3 +(30 +5) *i, CGRectGetMaxY(_timeRect) +5, 30, 30);
            if (CGRectGetMaxX(rect) > SCREEN_WIDTH - 12) {
                break;
            }
            
            [mArr addObject:NSStringFromCGRect(rect)];
        }
    }
    
    if (_model.reviews && _model.reviews.count) {
        
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSArray *subArr in _model.reviews) {
            for (int i = 0; i < subArr.count; i++) {
                
                CGRect rect;
                
                MDYReviewModel *review = subArr[i];
                
                _reviewStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@:%@", review.name, review.text]];
                
                [_reviewStr addAttribute:NSFontAttributeName
                                value:[UIFont systemFontOfSize:14.0f]
                                range:NSMakeRange(0, _reviewStr.length)];
                
                [_reviewStr addAttribute:NSForegroundColorAttributeName
                                value:[UIColor blueColor]
                                range:NSMakeRange(0, review.name.length +1)];
                [_reviewStr addAttribute:NSForegroundColorAttributeName
                                value:[UIColor blackColor]
                                range:NSMakeRange(review.name.length +1, review.text.length)];
                
                NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
                rect = [_reviewStr boundingRectWithSize:CGSizeMake(_contentWidth -20, MAXFLOAT)
                                             options:options
                                             context:nil];
                
                if (!mArr.count) {
                    CGRect tmp_rect = _reviewRectArr.count? CGRectFromString(_reviewRectArr[0]): _timeRect;
                    CGFloat y = _reviewRectArr.count? CGRectGetMaxY(tmp_rect) +10: CGRectGetMaxY(tmp_rect) +5;
                    
                    rect.origin = CGPointMake(_nameLabelRect.origin.x +10, y);
                    
                } else {
                    
                    rect.origin = CGPointMake(_nameLabelRect.origin.x +10, CGRectGetMaxY(CGRectFromString([mArr lastObject])) +5);
                    
                }
                
                [mArr addObject:NSStringFromCGRect(rect)];
                
            }
        }
        
        _reviewRectArr = [mArr copy];
    }

    _reviewBgRect.origin = CGPointMake(_nameLabelRect.origin.x, CGRectGetMaxY(_timeRect) -5);
    if (_reviewRectArr.count) {
        _reviewBgRect.size.height = CGRectGetMaxY(CGRectFromString([_reviewRectArr lastObject])) - CGRectGetMaxY(_timeRect) +15;
    } else if (_likeAvatorRectArr.count) {
        _reviewBgRect.size.height = CGRectGetMaxY(CGRectFromString([_likeAvatorRectArr lastObject])) - CGRectGetMaxY(_timeRect) +15;
    }
    _reviewBgRect.size.width = _contentWidth;
    
    _height = CGRectGetMaxY(_reviewBgRect) +20;
}



+ (instancetype)layoutWithMoment:(MDYLayoutModel *)moment {
    
    MDYLayout *ins = [[MDYLayout alloc] initWithMoment:moment];
    
    return ins;
    
}

@end
