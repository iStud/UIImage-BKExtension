//
//  UIImage+BKExtension.m
//  等比压缩图片
//
//  Created by mac on 16/11/26.
//  Copyright © 2016年 xbk. All rights reserved.
//

#import "UIImage+BKExtension.h"

@implementation UIImage (BKExtension)

- (UIImage *)compressWithWidth:(CGFloat)scaleWidth{

    //压缩后的高度
    CGFloat scaleHeight = scaleWidth/self.size.width * self.size.height;
    CGSize size = CGSizeMake(scaleWidth, scaleHeight);
    
    //开启图形上下文
    UIGraphicsBeginImageContext(size);
    
    //图片绘制到指定区域内
    [self drawInRect:CGRectMake(0, 0, scaleWidth, scaleHeight)];
    
    //通过图形上下文获取压缩后的图片
    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return scaleImage;
}

@end
