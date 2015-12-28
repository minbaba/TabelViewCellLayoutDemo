//
//  MQFactory.m
//  miaoqu_hl
//
//  Created by apple on 15/11/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MDYFactory.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@implementation MDYFactory


+ (UILabel *)labelWithFontSize:(CGFloat)size andNumberOfLines:(NSInteger)lines {
    UILabel *label = [[UILabel alloc] init];
    
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = lines;
    
    return label;
}

+ (UIButton *)ButtonWithType:(UIButtonType)type andImage:(UIImage *)image andTittle:(NSString *)tittle andFontSize:(CGFloat)size {
    UIButton *button = [UIButton buttonWithType:type];
    
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    
    if (tittle) {
        [button setTitle:tittle forState:UIControlStateNormal];
    }
    
    if (size) {
        button.titleLabel.font = [UIFont systemFontOfSize:size];
    }
    
    return button;
}



@end

