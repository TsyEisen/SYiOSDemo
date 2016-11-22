//
//  SYVideoToolBar.m
//  SYVideoPlay
//
//  Created by leju_esf on 16/11/22.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "SYVideoToolBar.h"
#import "UIView+SYExtension.h"

@interface SYVideoToolBar ()
@property (nonatomic, strong) UIButton *palyBtn;
@property (nonatomic, strong) UILabel *currentTimeLabel;
@property (nonatomic, strong) UILabel *totalTimeLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *fullScreenBtn;
@end

@implementation SYVideoToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    [self addSubview:self.palyBtn];
    [self addSubview:self.currentTimeLabel];
    [self addSubview:self.slider];
    [self addSubview:self.totalTimeLabel];
    [self addSubview:self.fullScreenBtn];
}

- (void)setTotalTime:(NSInteger)totalTime {
    _totalTime = totalTime;
    self.totalTimeLabel.text = [self handelTime:totalTime];
}

- (void)setCurrentTime:(NSInteger)currentTime {
    _currentTime = currentTime;
    self.currentTimeLabel.text = [self handelTime:currentTime];
    self.slider.value = _currentTime*1.0/self.totalTime;
}

- (void)palyAction {
    self.palyBtn.selected = !self.palyBtn.selected;
    if ([self.delegate respondsToSelector:@selector(playAction:)]) {
        [self.delegate playAction:self.palyBtn.selected];
    }
}

- (void)fullScreenAction {
    self.fullScreenBtn.selected = !self.fullScreenBtn.selected;
    if ([self.delegate respondsToSelector:@selector(fullScreenAction:)]) {
        [self.delegate fullScreenAction:self.fullScreenBtn.selected];
    }
}

- (NSString *)handelTime:(NSInteger)time {
    if (time >= 0 && time< 60) {
        return [NSString stringWithFormat:@"00:%02zd",time];
    }else if (time >= 60 && time < 3600) {
        NSInteger minutes = time/60;
        NSInteger second = time%60;
        return [NSString stringWithFormat:@"%02zd:%02zd",minutes,second];
    }else {
        NSInteger hours = time/3600;
        NSInteger minutes = (time%3600)/60;
        NSInteger second = (time%3600)%60;
       return [NSString stringWithFormat:@"%02zd:%02zd:%02zd",hours,minutes,second];
    }
}

#pragma mark - 懒加载

- (UISlider *)slider {
    if (_slider == nil) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(self.currentTimeLabel.sy_right, 0, self.sy_width - self.currentTimeLabel.sy_right * 2, self.sy_height)];
        [_slider setThumbImage:[UIImage imageNamed:@"video_toolbar_thumb"] forState:UIControlStateNormal];
    }
    return _slider;
}

- (UILabel *)currentTimeLabel {
    if (_currentTimeLabel == nil) {
        _currentTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.palyBtn.sy_right, 0, 50, self.sy_height)];
        _currentTimeLabel.text = @"00:00";
        _currentTimeLabel.font = [UIFont systemFontOfSize:10];
        _currentTimeLabel.textColor = [UIColor whiteColor];
        _currentTimeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _currentTimeLabel;
}

- (UILabel *)totalTimeLabel {
    if (_totalTimeLabel == nil) {
        _totalTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.slider.sy_right, 0, 50, self.sy_height)];
        _totalTimeLabel.text = @"00:00";
        _totalTimeLabel.font = [UIFont systemFontOfSize:10];
        _totalTimeLabel.textColor = [UIColor whiteColor];
        _totalTimeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _totalTimeLabel;
}

- (UIButton *)palyBtn {
    if (_palyBtn == nil) {
        _palyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _palyBtn.frame = CGRectMake(15, 0, self.sy_height, self.sy_height);
        [_palyBtn setBackgroundImage:[UIImage imageNamed:@"video_toolbar_play"] forState:UIControlStateNormal];
        [_palyBtn setBackgroundImage:[UIImage imageNamed:@"video_toolbar_pause"] forState:UIControlStateSelected];
        [_palyBtn addTarget:self action:@selector(palyAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _palyBtn;
}

- (UIButton *)fullScreenBtn {
    if (_fullScreenBtn == nil) {
        _fullScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _fullScreenBtn.frame = CGRectMake(self.sy_width - 15 - self.sy_height, 0, self.sy_height, self.sy_height);
        [_fullScreenBtn setBackgroundImage:[UIImage imageNamed:@"video_toolbar_zoomOut"] forState:UIControlStateNormal];
        [_fullScreenBtn setBackgroundImage:[UIImage imageNamed:@"video_toolbar_zoomIn"] forState:UIControlStateSelected];
        [_fullScreenBtn addTarget:self action:@selector(fullScreenAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fullScreenBtn;
}

@end