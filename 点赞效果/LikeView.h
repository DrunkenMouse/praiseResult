//
//  LikeView.h
//  点赞效果
//
//  Created by 王奥东 on 16/12/7.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikeView : UIView

@property(nonatomic, strong)UIImage *particleImage;
@property(nonatomic, assign)CGFloat particleScale;
@property(nonatomic, assign)CGFloat particleScaleRange;

-(void)animate;
@end
