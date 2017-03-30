//
//  LikeButton.m
//  点赞效果
//
//  Created by 王奥东 on 16/12/7.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "LikeButton.h"


@implementation LikeButton

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    self.clipsToBounds = NO;
    _fireworksView = [[LikeView alloc] init];
    [self insertSubview:_fireworksView atIndex:0];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}



-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    _fireworksView.frame = self.bounds;
    
    [self insertSubview:_fireworksView atIndex:0];
    
}

-(void)animate {
   
    
    [_fireworksView animate];
    
}


//弹出 变大缩小复原
-(void)popOutsideWithDuration:(NSTimeInterval)duration {
    
    self.transform = CGAffineTransformIdentity;
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
    
}



//弹进 变小返回
-(void)popInSideWithDuration:(NSTimeInterval)duration {
    
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/2.0 animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}


//获取粒子图像

-(UIImage *)particleImage {
    return self.fireworksView.particleImage;
}

//设置粒子图像
-(void)setParticleImage:(UIImage *)particleImage {
   
    self.fireworksView.particleImage = particleImage;
}

//获取缩放
-(CGFloat)particleScale {
    return self.fireworksView.particleScale;
}

//设置缩放
-(void)setParticleScale:(CGFloat)particleScale {
 
    self.fireworksView.particleScale = particleScale;
}

//获取缩放范围
-(CGFloat)particleScaleRange {
    return self.fireworksView.particleScaleRange;
}

//设置缩放范围
-(void)setParticleScaleRange:(CGFloat)particleScaleRange {
   
    self.fireworksView.particleScaleRange = particleScaleRange;
}

@end
