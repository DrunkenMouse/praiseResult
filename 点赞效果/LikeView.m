//
//  LikeView.m
//  点赞效果
//
//  Created by 王奥东 on 16/12/7.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "LikeView.h"

@interface LikeView()

@end

@implementation LikeView {
    NSArray *_emitterCells;
    CAEmitterLayer *_chargeLayer;
    CAEmitterLayer *_explosionLayer;
}

-(void)setup {
    self.clipsToBounds = NO;
    self.userInteractionEnabled = NO;
    
    /**
     粒子的velocity为发射默认初速速度，默认是0。
     CAEmitterLayer 粒子动画的设置
     CAEmitterCell粒子的设置
     emitterShape 发射源形状
     emitterMode 发射模式
     emitterCells 发射的粒子
     enderMode 特效渲染模式
     seed 用于初始化随机数产生的种子（粒子）
     Birthrate(出生率)：每秒发射的粒子数量
     */
    
    //动画刚开始先爆炸一部分，0.2秒后在爆炸更大一部分，爆炸结束粒子都是0
    
    _emitterCells = [NSArray array];
    
    CAEmitterCell *explosionCell = [CAEmitterCell emitterCell];
    explosionCell.name = @"explosion";
    explosionCell.alphaRange = 0.20;
    explosionCell.alphaSpeed = -1.0;
    

    explosionCell.lifetime = 0.7;
    explosionCell.lifetimeRange = 0.3;
    explosionCell.birthRate = 0;
    explosionCell.velocity = 40.00;
    explosionCell.velocityRange = 10.00;
    
    _explosionLayer = [CAEmitterLayer layer];
    _explosionLayer.name = @"emitterLayer";
    _explosionLayer.emitterShape = kCAEmitterLayerCircle;
    _explosionLayer.emitterMode = kCAEmitterLayerOutline;
    _explosionLayer.emitterSize = CGSizeMake(25, 0);
    _explosionLayer.emitterCells = @[explosionCell];
    _explosionLayer.renderMode = kCAEmitterLayerOldestFirst;
    _explosionLayer.masksToBounds = NO;
    _explosionLayer.seed = 1600;
    [self.layer addSublayer:_explosionLayer];
 
    //增加效果
    CAEmitterCell *chargeCell = [CAEmitterCell emitterCell];
    chargeCell.name = @"charge";
    chargeCell.alphaRange = 0.20;
    chargeCell.alphaSpeed = -1.0;
    
    chargeCell.lifetime = 0.3;
    chargeCell.lifetimeRange = 0.1;
    chargeCell.birthRate = 0;
    chargeCell.velocity = -40.0;
    chargeCell.velocityRange = 0.00;
    
    
    
    _chargeLayer = [CAEmitterLayer layer];
    _chargeLayer.name = @"emitterLayer";
    _chargeLayer.emitterShape = kCAEmitterLayerCircle;
    _chargeLayer.emitterMode = kCAEmitterLayerOutline;
    _chargeLayer.emitterSize = CGSizeMake(25, 0);
    _chargeLayer.emitterCells = @[chargeCell];
    _chargeLayer.renderMode = kCAEmitterLayerOldestFirst;
    _chargeLayer.masksToBounds = NO;
    _chargeLayer.seed = 1600;
    
    [self.layer addSublayer:_chargeLayer];
    
    
    
    _emitterCells = @[chargeCell, explosionCell];
    
    
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}
//布局
-(void)layoutSubviews {
    
    [super layoutSubviews];
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    _chargeLayer.emitterPosition = center;
    _explosionLayer.emitterPosition = center;
    
}


//动画

-(void)animate {
    
    //注意forKeyPath
    //先爆炸一部分
    _chargeLayer.beginTime = CACurrentMediaTime();
    [_chargeLayer setValue:@80 forKeyPath:@"emitterCells.charge.birthRate"];
    [self performSelector:@selector(explode) withObject:nil afterDelay:0.2];
    
    
}

//爆炸效果
-(void)explode {
    //在爆炸更大一部分
    [_chargeLayer setValue:@0 forKeyPath:@"emitterCells.charge.birthRate"];
    _explosionLayer.beginTime = CACurrentMediaTime();
    [_explosionLayer setValue:@800 forKeyPath:@"emitterCells.explosion.birthRate"];
    [self performSelector:@selector(stop) withObject:nil afterDelay:0.1];

}

-(void)stop {
    //消除
    [_chargeLayer setValue:@0 forKeyPath:@"emitterCells.charge.birthRate"];
    [_explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosion.birthRate"];
}



-(void)setParticleImage:(UIImage *)particleImage {
    
    _particleImage = particleImage;
    for (CAEmitterCell *cell in _emitterCells) {
        cell.contents = (id)[particleImage CGImage];
    }
}

-(void)setParticleScale:(CGFloat)particleScale {
    
    _particleScale = particleScale;
    for (CAEmitterCell *cell in _emitterCells) {
        cell.scale = particleScale;
    }
}


-(void)setParticleScaleRange:(CGFloat)particleScaleRange {
    
    _particleScaleRange = particleScaleRange;
    for (CAEmitterCell *cell in _emitterCells) {
        cell.scaleRange = particleScaleRange;
    }
}

@end
