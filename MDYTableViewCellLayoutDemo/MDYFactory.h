//
//  MQFactory.h
//  miaoqu_hl
//
//  Created by apple on 15/11/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface MDYFactory : NSObject

+ (UILabel *)labelWithFontSize:(CGFloat)size andNumberOfLines:(NSInteger)lines;


+ (UIButton *)ButtonWithType:(UIButtonType)type andImage:(UIImage *)image andTittle:(NSString *)tittle andFontSize:(CGFloat)size;




@end
