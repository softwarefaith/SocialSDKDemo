//
//  MLSocialSelectView.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/24.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLSocialSelectView.h"
#import "MLSocialItem.h"


@interface MLItemView : UIControl

@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation MLItemView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.iconImageView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 50);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.iconImageView.frame)+8, CGRectGetWidth(self.frame), 12);
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12.0f];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

@end


@interface MLSocialSelectView ()

@property(nonatomic, copy) NSArray<MLSocialItem *>* channels;
@property(nonatomic, copy) MLSelectViewCompletionBlock completionBlock;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic,strong) UIView *sharedView;

@end

@implementation MLSocialSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)dealloc {
    NSLog(@"social window 销毁了");
}

- (instancetype)initWithChannels:(NSArray<MLSocialItem *> *)channels completionBlock:(MLSelectViewCompletionBlock)completionBlock {
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        [self setWindowLevel:UIWindowLevelAlert + 100];
        self.backgroundColor = [UIColor grayColor];
        self.userInteractionEnabled = YES;
      
        _completionBlock = [completionBlock copy];
        _channels = [channels copy];
        [self setupSubViews];
    }

    return self;
}

- (void)setupSubViews {
    
    [self addSubview:self.sharedView];
    
    CGFloat width = CGRectGetWidth(self.sharedView.frame);

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width,  57)];
    _titleLabel.text = @"分享至";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.sharedView addSubview:self.titleLabel];
    

    UIButton *closedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closedButton.frame = CGRectMake(width - 12 - 20, 20, 12, 12);
    [closedButton setImage:[UIImage imageNamed:@"MLSocialResourse.bundle/social_close"] forState:UIControlStateNormal];
    [closedButton addTarget:self action:@selector(closedWindwAction) forControlEvents:UIControlEventTouchUpInside];
    [self.sharedView addSubview:closedButton];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 57.5, width, 0.5)];
    line.backgroundColor = [UIColor greenColor];
    [self.sharedView addSubview:line];
    
    [self createItemsUI];
    
}

- (void)createItemsUI {
    
    CGFloat wh = 50;
    
    NSInteger row = 4;
    
    CGFloat spacing = (CGRectGetWidth([UIScreen mainScreen].bounds) - wh * row) / (row + 1);
    for (NSInteger i = 0; i < [self.channels count]; i++) {
        
        MLSocialItem *item = [self.channels objectAtIndex:i];
        
        MLItemView *itemView = [[MLItemView alloc] initWithFrame:CGRectMake(spacing + (i % row )* (wh + spacing) , 58 + 30, wh, wh + 20)];
        itemView.iconImageView.image = [UIImage imageNamed:item.imagePath];
        itemView.titleLabel.text = item.title;
        itemView.tag = 999 + i;
        [itemView addTarget:self action:@selector(didSelectItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.sharedView addSubview:itemView];
    }
}


- (void)show {
    
}
#pragma mark - Action
- (void)closedWindwAction {
    [self removeIsCancel:YES reourcesType:MLResourceTypeNone];
}

- (void)didSelectItemAction:(MLItemView *)sender {
    
    NSInteger tag = sender.tag - 999;
    
    if (tag < [self.channels count]) {
        MLSocialItem *item = [self.channels objectAtIndex:tag];
        [self removeIsCancel:NO reourcesType:item.resourceType];
    }
}

- (void)removeIsCancel:(BOOL)isCancel reourcesType:(MLResourceType)reourcesType {
    if (_completionBlock) {
        _completionBlock(isCancel,reourcesType);
    }
    [self resignKeyWindow];
    _window = nil;
}

#pragma mark setter
- (UIView *)sharedView {
    if (_sharedView == nil) {
        CGFloat height = 188;
        _sharedView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) - height, CGRectGetWidth([UIScreen mainScreen].bounds), height)];
        _sharedView.backgroundColor = [UIColor whiteColor];
    }
    return _sharedView;
}

@end
