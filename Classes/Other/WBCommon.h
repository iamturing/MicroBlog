
// 0.账号相关
#define WBAppKey @"179738748"
#define WBAppSecret @"c039808c06032eaf9a2d33f4a83cdb22"
#define WBRedirectURI @"http://www.baidu.com"
#define WBLoginURL [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", WBAppKey, WBRedirectURI]

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


// 2.获得RGB颜色
#define WBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义日志打印Log
#ifdef DEBUG
#define WBLog(...) NSLog(__VA_ARGS__)
#else
#define WBLog(...)
#endif

//4.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 5.微博cell上面的属性
/** 昵称的字体 */
#define WBStatusNameFont [UIFont systemFontOfSize:15]
/** 被转发微博作者昵称的字体 */
#define WBRetweetStatusNameFont WBStatusNameFont

/** 时间的字体 */
#define WBStatusTimeFont [UIFont systemFontOfSize:12]
/** 来源的字体 */
#define WBStatusSourceFont WBStatusTimeFont

/** 正文的字体 */
#define WBStatusContentFont [UIFont systemFontOfSize:13]
/** 被转发微博正文的字体 */
#define WBRetweetStatusContentFont WBStatusContentFont

/** 表格的边框宽度 */
#define WBStatusTableBorder 5
#define WBSettingTableBorder WBStatusTableBorder
/** cell的边框宽度 */
#define WBStatusCellBorder 10
#define WBSettingCellMargin 5

// 6.微博cell内部相册
#define WBPhotoW 70
#define WBPhotoH 70
#define WBPhotoMargin 10

//7.常用的通知对象
#define WBNotificationCenter [NSNotificationCenter defaultCenter]

#define WBGlobalBg WBColor(232, 233, 232)


