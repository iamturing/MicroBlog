//
//  WBComposeViewController.m
//  MicroBlog
//
//  Created by wangzhaolu on 15-3-18.
//  Copyright (c) 2015年 turing. All rights reserved.
//

#import "WBComposeViewController.h"
#import "WBTextView.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "MBProgressHUD+MJ.h"
#import "WBComposeToolbar.h"
#import "WBComposePhotosView.h"
#import "WBHttpTool.h"
#import "WBStatusTool.h"


@interface WBComposeViewController ()<UITextViewDelegate, WBComposeToolbarDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) WBTextView *textView;
@property (nonatomic, weak) WBComposeToolbar *toolbar;
@property (nonatomic, weak) WBComposePhotosView *photosView;
@end

@implementation WBComposeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏属性
    [self setupNavBar];
    
    //添加textview
    [self setupTextView];
    
    //添加toolbar
    [self setupToolbar];
    
    //添加photosView
    [self setupPhotosView];
}

/**
 *  添加photosView
 */
- (void)setupPhotosView
{
    WBComposePhotosView *photosView = [[WBComposePhotosView alloc] init];
    CGFloat photosW = self.textView.frame.size.width;
    CGFloat photosH = self.textView.frame.size.height;
    CGFloat photosY = 80;
    photosView.frame = CGRectMake(0, photosY, photosW, photosH);
    [self.textView addSubview:photosView];
    self.photosView = photosView;
}

/**
 *  添加toolbar
 */
- (void)setupToolbar
{
    WBComposeToolbar *toolbar=[[WBComposeToolbar alloc]init];
    toolbar.delegate = self;
    CGFloat toolbarH = 44;
    CGFloat toolbarW = self.view.frame.size.width;
    CGFloat toolbarX = 0;
    CGFloat toolbarY = self.view.frame.size.height - toolbarH;
    toolbar.frame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
    [self.view addSubview:toolbar];
    self.toolbar = toolbar;
}


#pragma mark - toolbar的代理方法
- (void)composeToolbar:(WBComposeToolbar *)toolbar didClickedButton:(WBComposeToolbarButtonType)buttonType
{
    switch (buttonType) {
        case WBComposeToolbarButtonTypeCamera:
            [self openCamera];  //相机
            break;
        case WBComposeToolbarButtonTypePicture: // 相册
            [self openPhotoLibrary];
            break;
        default:
            break;
    }
}

/**
 *  打开相机
 */
- (void)openCamera
{
    UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
    ipc.sourceType=UIImagePickerControllerSourceTypeCamera;
    ipc.delegate=self;
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
- (void)openPhotoLibrary
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}


#pragma mark - 图片选择控制器的代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //1.销毁picker控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //2.去的图片
    UIImage *image=info[UIImagePickerControllerOriginalImage];
    [self.photosView addImage:image];
}


/**
 *  添加textView
 */
- (void)setupTextView
{
    //1.添加
    WBTextView *textView=[[WBTextView alloc]init];
    textView.font=[UIFont systemFontOfSize:15];
    textView.frame=self.view.bounds;
    //垂直方向上永远可以拖拽
    textView.alwaysBounceVertical=YES;
    textView.delegate=self;
    textView.placeholder=@"分享新鲜事吧...";
    [self.view addSubview:textView];
    self.textView=textView;
    
    //2.监听textView文字改变的通知
    [WBNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
    
    // 3.监听键盘的通知
    [WBNotificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [WBNotificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 *  监听文字改变
 */
- (void)textDidChange
{
    self.navigationItem.rightBarButtonItem.enabled = (self.textView.text.length != 0);
}

- (void)dealloc
{
    [WBNotificationCenter removeObserver:self];
}

#pragma mark - 键盘事件

/**
 *  键盘即将显示的时候调用
 */
- (void)keyboardWillShow:(NSNotification *)note
{
    //1.取出键盘的frame
    CGRect keyboardF=[note.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    
    //2.取出键盘弹出的时间
    CGFloat duration=[note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    //3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.toolbar.transform=CGAffineTransformMakeTranslation(0, -keyboardF.size.height);
    }];
}


/**
 *  键盘即将退出的时候调用
 */
- (void)keyboardWillHide:(NSNotification *)note
{
    // 1.取出键盘弹出的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.toolbar.transform = CGAffineTransformIdentity;
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}


/**
 *  设置导航栏属性
 */
- (void)setupNavBar
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    self.title = @"发微博";
}


/**
 *  取消
 */
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发微博
 */
- (void)send
{
    if (self.photosView.totalImages.count) { // 有图片
        [self sendWithImage];
    } else { // 没有图片
        [self sendWithoutImage];
    }
    
    // 关闭控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}



/**
 *  发有图片的微博
 */
- (void)sendWithImage
{
    // 1.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"status"] = self.textView.text;
    params[@"access_token"] = [WBAccountTool account].access_token;
    
    // 2.封装文件参数
    NSMutableArray *formDataArray = [NSMutableArray array];
    NSArray *images = [self.photosView totalImages];
    for (UIImage *image in images) {
        WBFormData *formData = [[WBFormData alloc] init];
        formData.data = UIImageJPEGRepresentation(image, 0.000001);
        formData.name = @"pic";
        formData.mimeType = @"image/jpeg";
        formData.filename = @"";
        [formDataArray addObject:formData];
    }
    
    // 3.发送请求
    [WBHttpTool postWithURL:@"https://upload.api.weibo.com/2/statuses/upload.json" params:params formDataArray:formDataArray success:^(id json) {
        [MBProgressHUD showSuccess:@"发送成功"];
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"发送失败"];
    }];
}

/**
 *  发没有图片的微博
 */
- (void)sendWithoutImage
{
    // 1.封装请求参数(面向模型开发)
    WBSendStatusParam *param=[WBSendStatusParam param];
    param.status=self.textView.text;
    
    // 2.发送请求
    [WBStatusTool sendStatusWithParam:param success:^(WBSendStatusResult *result) {
        [MBProgressHUD showSuccess:@"发送成功"];
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"发送失败"];
    }];
}

@end
