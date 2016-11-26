//
//  UIImage+BKExtension.h
//  等比压缩图片
//
//  Created by mac on 16/11/26.
//  Copyright © 2016年 xbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BKExtension)

/**
 *  根据指定压缩宽度,生成等比压缩后的图片
 *
 *  @param scaleWidth 压缩宽度
 *
 *  @return 等比压缩后的图片
 */
- (UIImage *)compressWithWidth:(CGFloat)scaleWidth;


@end
