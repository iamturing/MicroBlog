//
//  WBStatusToolbar.m
//  MicroBlog
//
//  Created by student on 15-3-10.
//  Copyright (c) 2015年 itany. All rights reserved.
//

/**
 * OS开发懒加载
 * 1.懒加载基本
 *  懒加载——也称为延迟加载，即在需要的时候才加载（效率低，占用内存小）。所谓懒加载，写的是其get方法.
 *  注意：如果是懒加载的话则一定要注意先判断是否已经有了，如果没有那么再去进行实例化
 * 2.使用懒加载的好处：
 * （1）不必将创建对象的代码全部写在viewDidLoad方法中，代码的可读性更强
 * （2）每个控件的getter方法中分别负责各自的实例化处理，代码彼此之间的独立性强，松耦合
 */

#import "WBStatusToolbar.h"
#import "WBStatus.h"


@interface WBStatusToolbar ()
@property (nonatomic, strong) NSMutableArray * btns;
@property (nonatomic, strong) NSMutableArray * deviders;
@property (nonatomic,weak) UIButton * retweetBtn;
@property (nonatomic,weak) UIButton * commentBtn;
@property (nonatomic,weak) UIButton * attitudeBtn;
@end

@implementation WBStatusToolbar


/**
 *  对btn的懒加载
 */
- (NSMutableArray *)btns
{
    if (_btns==nil) { ////判断是否已经有了，若没有，则进行实例化
        _btns=[NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)dividers
{
    if (_deviders==nil) {
        _deviders=[NSMutableArray array];
    }
    return _deviders;
}

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        // 1.设置图片
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_card_bottom_background"];
        self.highlightedImage = [UIImage resizedImageWithName:@"timeline_card_bottom_background_highlighted"];
        
        // 2.添加按钮
        self.retweetBtn = [self setupBtnWithTitle:@"转发" image:@"timeline_icon_retweet" bgImage:@"timeline_card_leftbottom_highlighted"];
        self.commentBtn = [self setupBtnWithTitle:@"评论" image:@"timeline_icon_comment" bgImage:@"timeline_card_middlebottom_highlighted"];
        self.attitudeBtn = [self setupBtnWithTitle:@"赞" image:@"timeline_icon_unlike" bgImage:@"timeline_card_rightbottom_highlighted"];
        
        // 3.添加分割线
        [self setupDivider];
        [self setupDivider];
    }
    return self;
}

/**
 *  初始化分割线
 */
- (void)setupDivider
{
    UIImageView *divider=[[UIImageView alloc]init];
    divider.image=[UIImage imageWithName:@"timeline_card_bottom_line"];
    [self addSubview:divider];
    [self.dividers addObject:divider];
}

/**
 *  初始化按钮
 *
 *  @param title   按钮的文字
 *  @param image   按钮的小图片
 *  @param bgImag  按钮的背景
 */
- (UIButton *)setupBtnWithTitle:(NSString *)title image:(NSString *)image bgImage:(NSString *)bgImage
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.adjustsImageWhenHighlighted = NO;
    [btn setBackgroundImage:[UIImage resizedImageWithName:bgImage] forState:UIControlStateHighlighted];
    [self addSubview:btn];
    
    // 添加按钮到数组
    [self.btns addObject:btn];
    
    return btn;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置按钮的frame
    int dividerCount = self.dividers.count; // 分割线的个数
    CGFloat dividerW = 2; // 分割线的宽度
    int btnCount = self.btns.count;
    CGFloat btnW = (self.frame.size.width - dividerCount * dividerW) / btnCount;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.btns[i];
        
        // 设置frame
        CGFloat btnX = i * (btnW + dividerW);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    // 2.设置分割线的frame
    CGFloat dividerH = btnH;
    CGFloat dividerY = 0;
    for (int j = 0; j<dividerCount; j++) {
        UIImageView *divider = self.dividers[j];
        
        // 设置frame
        UIButton *btn = self.btns[j];
        CGFloat dividerX = CGRectGetMaxX(btn.frame);
        divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    }
}

- (void)setStatus:(WBStatus *)status
{
    _status=status;
    
    //1.设置转发数
    [self setupBtn:self.retweetBtn originalTitle:@"转发" count:status.reposts_count];
    [self setupBtn:self.commentBtn originalTitle:@"评论" count:status.comments_count];
    [self setupBtn:self.attitudeBtn originalTitle:@"赞" count:status.attitudes_count];
}

/**
 *  设置按钮的显示标题
 *
 *  @param btn           哪个按钮需要设置标题
 *  @param originalTitle 按钮的原始标题（显示的数字为0的时候，显示这个原始标题）
 *  @param count         显示的个数
 */
- (void)setupBtn:(UIButton *)btn originalTitle:(NSString *)originalTitle count:(int)count
{
    
    if (count) { // 个数不为0
        NSString *title = nil;
        if (count < 10000) { // 小于1W
            title = [NSString stringWithFormat:@"%d", count];
        } else { // >= 1W
            double countDouble = count / 10000.0;
            title = [NSString stringWithFormat:@"%.1f万", countDouble];
            
            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }
        [btn setTitle:title forState:UIControlStateNormal];
    } else {
        [btn setTitle:originalTitle forState:UIControlStateNormal];
    }
}

@end
