//
//  LikeButton.h
//  点赞效果
//
//  Created by 王奥东 on 16/12/7.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LikeView.h"

@interface LikeButton : UIButton

@property(nonatomic, strong)UIImage * particleImage;
@property(nonatomic, assign)CGFloat particleScale;
@property(nonatomic, assign)CGFloat particleScaleRange;
@property(nonatomic, strong)LikeView * fireworksView;

-(void)animate;
-(void)popOutsideWithDuration:(NSTimeInterval)duration;
-(void)popInSideWithDuration:(NSTimeInterval)duration;

@end
