//
//  ViewController.m
//  点赞效果
//
//  Created by 王奥东 on 16/12/7.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "LikeButton.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    IBOutlet LikeButton *_likeButton;
    IBOutlet UILabel *_label;
    BOOL _selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _likeButton.particleImage = [UIImage imageNamed:@"3.png"];
    _likeButton.particleScale = 0.05;
    _likeButton.particleScaleRange = 0.02;
    
}


- (IBAction)clickLike:(id)sender {
    
    
    _selected = !_selected;
    if (_selected) {
        [_likeButton popOutsideWithDuration:0.5];
        [_likeButton setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        [_likeButton animate];
        _label.text = @"已赞";
    }else {
        [_likeButton popInSideWithDuration:0.4];
        [_likeButton setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        _label.text = @"赞";
    }
    
}


@end
