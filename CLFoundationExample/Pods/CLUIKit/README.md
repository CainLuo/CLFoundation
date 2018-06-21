# CLUIKit


[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/CLUIKit.svg)](https://img.shields.io/cocoapods/v/CLUIKit.svg) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Platform](https://img.shields.io/cocoapods/p/CLUIKit.svg?style=flat)](http://cocoadocs.org/docsets/CLUIKit) [![Language](https://img.shields.io/badge/language-ObjC-blue.svg)](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)

## CLUIKit简介

`CLUIKit`是对系统`UIKit API`进行扩展, 以及一些自己封装的`UI`, `API`的用法全部都在`CLUIKitExample`里, 如果在使用库遇到的一些疑惑欢迎随时`Issues`给我.

支持`CocoaPod`管理

> pod 'CLUIKit'



## 支助
如果您觉得挺赞的话, 可以给我打赏打赏, 谢谢啦~

![支付宝](https://raw.githubusercontent.com/CainRun/PayProject/master/WeChatPay-Objective-C/Images/支付宝QRC.jpg)



## 目录

- [CLAnimatorManager@](#CLAnimatorManager)
  - [UICubicTimingParameters@](#UICubicTimingParameters)
  - [UISpringTimingParameters@](#UISpringTimingParameters)
  - [UIViewPropertyAnimator@](#UIViewPropertyAnimator)
  - [UIViewPropertyAnimator控制相关@](#UIViewPropertyAnimator控制相关)
- [CLButton@](#CLButton)
- [CLCollectionViewController@](#CLCollectionViewController)
  - [UICollectionView与MJRefresh@](#UICollectionView与MJRefresh)
  - [UICollectionView代理与数据源@](#代理与数据源)
  - [注册类@](#注册类)
  - [CLCollectionViewDataSource@](#CLCollectionViewDataSource)
  - [CLCollectionViewDelegate@](#CLCollectionViewDelegate)
  - [CLCollectionViewDragDelegate@](#CLCollectionViewDragDelegate)
  - [CLCollectionViewDropDelegate@](#CLCollectionViewDropDelegate)
  - [CLCollectionViewViewModel@](#CLCollectionViewViewModel)
- [CLNavigationController@](#CLNavigationController)
- [CLScanQRCodeController@](#CLScanQRCodeController)
  - [获取数据(Block)@](#获取数据(Block))
  - [获取数据(Delegate)@](#获取数据(Delegate))
- [CLScrollViewController@](#CLScrollViewController)
  - [UIScrollView代理与数据源@](#UIScrollView代理与数据源)
- [CLTableViewController@](#CLTableViewController)
  - [UITableView与MJRefresh@](#UITableView与MJRefresh)
  - [UITableView代理与数据源@](#UITableView代理与数据源)
  - [CLTableViewDataSource@](#CLTableViewDataSource)
  - [CLTableViewDelegate@](#CLTableViewDelegate)
  - [CLTableViewDragDelegate@](#CLTableViewDragDelegate)
  - [CLTableViewDropDelegate@](#CLTableViewDropDelegate)
  - [CLTableViewViewModel@](#CLTableViewViewModel)
- [CLTextField@](#CLTextField)
- [CLToolBarListView@](#CLToolBarListView)
- [CLViewController@](#CLViewController)
  - [CLViewControllerViewModel@](#CLViewControllerViewModel)
- [CLWebViewControoler@](#CLWebViewControoler)
  - [CLWebViewNavigationDelegate@](#CLWebViewNavigationDelegate)
  - [CLWebViewUIDelegate@](#CLWebViewUIDelegate)
  - [CLWebViewViewModel@](#CLWebViewViewModel)
- [UIApplication+CLApplication@](#UIApplication+CLApplication)
- [UIButton+CLButton@](#UIButton+CLButton)
- [UICollectionView+CLCollectionView@](#UICollectionView+CLCollectionView)
  - [UICollectionView占位图代理@](#UICollectionView占位图代理)
  - [UICollectionView刷新@](#UICollectionView刷新)
- [UIColor+CLColor@](#UIColor+CLColor)
- [UIControl+CLControl@](#UIControl+CLControl)
- [UIDevice+CLDevice@](#UIDevice+CLDevice)
  - [设备相关@](#设备相关)
  - [CPU相关@](#CPU相关)
  - [网络相关@](#网络相关)
  - [存储相关@](#存储相关)
  - [内存相关@](#内存相关)
- [UIFont+CLFont@](#UIFont+CLFont)
- [UIImage+CLImage@](#UIImage+CLImage)
  - [生成指定颜色的图片@](#生成指定颜色的图片)
  - [截取指定视图大小的截图@](#截取指定视图大小的截图)
  - [缩放指定比例的图片@](#缩放指定比例的图片)
  - [加载GIF图片@](#加载GIF图片)
  - [生成二维码@](#生成二维码)
  - [获取图片@](#获取图片)
  - [图片高斯模糊处理@](#图片高斯模糊处理)
  - [图片圆角处理@](图片圆角处理)
  - [图片处理](#图片处理)
- [UINavigationController+CLNavigationController](#UINavigationController+CLNavigationController)
- [UINavigationItem+CLNavigationItem@](#UINavigationItem+CLNavigationItem)
- [UIScreen+CLScreen@](#UIScreen+CLScreen)
- [UITableView+CLTableView@](#UITableView+CLTableView)
  - [UITableView+CLTableView占位代理@](#UITableView+CLTableView占位代理)
  - [UITableView+CLTableView刷新@](#UITableView+CLTableView刷新)
  - [UITableView+CLTableView显示IndexPath@](#UITableView+CLTableView显示IndexPath)
  - [UITableView+CLTableView插入IndexPath@](#UITableView+CLTableView插入IndexPath)
  - [UITableView+CLTableView删除IndexPath@](#UITableView+CLTableView删除IndexPath)
- [UIView+CLView@](#UIView+CLView)
- [UIViewController+CLViewController@](#UIViewController+CLViewController)
  - [UIViewControllerBackItem检测代理@](#UIViewControllerBackItem检测代理)
  - [UIViewController+CLViewController方法@](#UIViewController+CLViewController方法)

## CLAnimatorManager

`CLAnimatorManager`是针对系统的`UIViewPropertyAnimator `封装的一个类库, 只支持`iOS 10`之后的系统.

### UICubicTimingParameters

```objective-c
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(CLAnimatorManagerBlock)animations
                                  completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(CLAnimatorManagerBlock)animations
                                  completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);
```

### UISpringTimingParameters

```objective-c
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);
```

### UIViewPropertyAnimator

```objective-c
typedef void(^CLAnimatorManagerBlock)(void);
typedef void(^CLAnimatorManagerCompleteBlock)(UIViewAnimatingPosition finalPosition);
typedef void(^CLAnimatorManagerStatusBlock)(UIViewAnimatingState state);

@property (nonatomic, strong, readonly) UIViewPropertyAnimator *cl_viewPropertyAnimator;

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);
```

### UIViewPropertyAnimator控制相关

```objective-c
- (void)cl_starViewPropertyAnimator;

- (void)cl_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay;

- (void)cl_pauseViewPropertyAnimator;

- (void)cl_stopViewPropertyAnimator:(BOOL)stop;

- (void)cl_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position;
```



## CLButton@

`CLButton`是对系统`UIButton`的封装并添加了一些特性:

```objective-c
typedef NS_ENUM(NSInteger, CLButtonStyle) {
    
    CLButtonImageTopStyle = 0,
    CLButtonImageLeftStyle,
    CLButtonImageBottomStyle,
    CLButtonImageRightStyle
};

@property (nonatomic, assign) CLButtonStyle cl_buttomImageStyle;
@property (nonatomic, assign) CGFloat cl_imageSpacing;
@property (nonatomic, assign) CGSize cl_imageSize;
```



## CLCollectionViewController@

`CLCollectionViewController`是对系统`UIViewController + UICollectionView`的封装并添加了一些特性:

```objective-c
- (void)cl_hiddenCollectionViewScrollIndicator;
```


### UICollectionView与MJRefresh@

```objective-c
- (void)cl_removeRefresh;

- (void)cl_removeHeaderRefresh;

- (void)cl_removeFooterRefresh;

- (void)cl_dropDownRefresh;

- (void)cl_dropDownBeginRefresh;

- (void)cl_dropDownEndRefresh;

- (void)cl_pullUpRefresh;

- (void)cl_pullUpBeginRefresh;

- (void)cl_pullUpEndRefresh;

- (void)cl_endCollectionViewRefreshWithType:(CLCollectionViewRefreshType)refreshType;
```


### UICollectionView代理与数据源@

```objective-c
- (void)cl_setCollectionViewDelegate:(_Nullable id <UICollectionViewDelegate>)delegate
                          dataSource:(_Nullable id <UICollectionViewDataSource>)dataSource;

- (void)cl_setCollectionViewDragDelegate:(_Nullable id <UICollectionViewDragDelegate>)dragDelegate
                            dropDelegate:(_Nullable id <UICollectionViewDropDelegate>)dropDelegate API_AVAILABLE(ios(11.0));
```


### 注册类

```objective-c
- (void)cl_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier;
```

### CLCollectionViewDataSource@

`CLCollectionViewDataSource`是`CLCollectionViewController`的数据源, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

- (instancetype)initCollectionViewDataSourceWithViewModel:(CLCollectionViewViewModel *)viewModel;
```

### CLCollectionViewDelegate@

`CLCollectionViewDelegate`是`CLCollectionViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

- (instancetype)initCollectionViewDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel;
```

### CLCollectionViewDragDelegate@

`CLCollectionViewDragDelegate`是`CLCollectionViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

- (instancetype)initCollectionViewDragDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel;
```

### CLCollectionViewDropDelegate@

`CLCollectionViewDropDelegate`是`CLCollectionViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

- (instancetype)initCollectionViewDropDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel;
```

### CLCollectionViewViewModel

`CLCollectionViewViewModel`是`CLCollectionViewController`的`ViewModel`, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewController *cl_collectionViewController;

@property (nonatomic, strong) NSMutableArray *cl_dataSource;

- (instancetype)initCollectionViewBaseModelWithController:(CLCollectionViewController *)viewController;

- (void)cl_collectionViewHTTPRequest;
```



## CLNavigationController@

`CLNavigationController`是针对系统`UINavigationController`的封装并添加了一些特性:

```objective-c
@property (nonatomic, strong) UIImage *cl_backgroundImage;

@property (nonatomic, strong) UIColor *cl_tintColor;

@property (nonatomic, strong) UIColor *cl_foregroundColor;

@property (nonatomic, strong) UIImage *cl_shadowImage;
```



`CLNavigationController`默认重载了`pushViewController:animated:`, 会在`pushViewController`的时候自动隐藏掉`UITarBar`.



## CLScanQRCodeController@

`CLScanQRCodeController`是基于`AVFoundation`进行封装的`QRCode`扫描库, 系统默认识别十三种编码:

```objective-c
@property (nonatomic, strong) UIView *cl_scanQRCodeView;

@property (nonatomic, assign) BOOL cl_autoStopCaptureSessionRunning;

@property (nonatomic, weak) id <CLScanQRCodeControllerDelegate> cl_scanQRCodeControllerDelegate;

- (void)cl_startCaptureSessionRunning;

- (void)cl_stopCaptureSessionRunning;
```


### 获取数据(Block)@

```objective-c
@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataObjectsBlock)(NSArray *metadataObjects);

@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataStringValue)(NSString *stringValue);
```


### 获取数据(Delegate)@

```objective-c
- (void)cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:(NSArray *)metadataObjects;

- (void)cl_scanQRCodeGetMetadataStringValue:(NSString *)stringValue;
```



## CLScrollViewController@

`CLScrollViewController`是基于系统`UIViewController+UIScrollView`的封装并添加了一些特性:

```objective-c
@property (nonatomic, strong, readonly) UIScrollView *cl_scrollView;

- (void)cl_hiddenScrollIndicator;
```

### UIScrollView代理@

```objective-c
- (void)cl_setScrollViewDelegate:(_Nullable id <UIScrollViewDelegate>)delegate;
```

### CLScrollViewViewModel

```objective-c
@property (nonatomic, weak, readonly) CLScrollViewController *cl_scrollViewController;

- (instancetype)initScrollViewDelegateWithController:(CLScrollViewController *)controller;
```



## CLTableViewController@

`CLTableViewController`是针对系统`UIViewController + UITableView`的封装并添加了一些特性:

```objective-c
@property (nonatomic, strong, null_resettable, readonly) UITableView *cl_tableView;

- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style;

- (void)cl_hiddenTableViewScrollIndicator;
```


### UITableView与MJRefresh@

```objective-c
- (void)cl_removeRefresh;

- (void)cl_removeHeaderRefresh;

- (void)cl_removeFooterRefresh;

- (void)cl_dropDownRefresh;

- (void)cl_dropDownBeginRefresh;

- (void)cl_dropDownEndRefresh;

- (void)cl_pullUpRefresh;

- (void)cl_pullUpBeginRefresh;

- (void)cl_pullUpEndRefresh;

- (void)cl_endTableViewRefreshWithType:(CLTableViewRefreshType)refreshType;
```


### UITableView代理与数据源@

```objective-c
- (void)cl_setTableViewDelegate:(_Nullable id <UITableViewDelegate>)delegate
                     dataSource:(_Nullable id <UITableViewDataSource>)dataSource;

- (void)cl_setTableViewDragDelegate:(_Nullable id <UITableViewDragDelegate>)dragDelegate
                       dropDelegate:(_Nullable id <UITableViewDropDelegate>)dropDelegate API_AVAILABLE(ios(11.0));
```

### CLTableViewDataSource@

`CLTableViewDataSource`是`CLTableViewController`的数据源, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

- (instancetype)initTableViewDataSourceWithViewModel:(CLTableViewViewModel *)viewModel;
```

### CLTableViewDelegate@

`CLTableViewDelegate`是`CLTableViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

- (instancetype)initTableViewDelegateWithViewModel:(CLTableViewViewModel *)viewModel;
```

### CLTableViewDragDelegate@

`CLTableViewDragDelegate`是`CLTableViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

- (instancetype)initTableViewDragDelegateWithViewModel:(CLTableViewViewModel *)viewModel;
```

### CLTableViewDropDelegate@

`CLTableViewDropDelegate`是`CLTableViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

- (instancetype)initTableViewDropDelegateWithViewModel:(CLTableViewViewModel *)viewModel;
```

### CLTableViewViewModel@

`CLTableViewViewModel`是`CLTableViewController`的`ViewModel`, 需要配合着使用:

```objective-c
@property (nonatomic, strong) NSMutableArray *cl_dataSource;

@property (nonatomic, weak, readonly) CLTableViewController *cl_tableViewController;

- (instancetype)initTableViewBaseModelWithController:(CLTableViewController *)viewController;

- (void)cl_tableViewHTTPRequest;

- (void)cl_configTableViewWithDataSource;
```



关于`CLTableViewController`封装的原理: [玩转iOS开发：打造一个低耦合可复用的《TableViewController》](https://cainrun.github.io/15009611814095.html).



## CLTextField@

`CLTextField`是针对系统`UITextField`的封装并添加了一些特性:

```objective-c
typedef NS_ENUM(NSInteger, CLTextFieldType) {
    
    CLTextFieldBottomNormal = 0, // default
    CLTextFieldBottomLineType
};

@property (nonatomic, assign) CLTextFieldType cl_textFieldType;

@property (nonatomic, strong) UIColor *cl_lineColor;
```



## CLToolBarListView@

`CLToolBarListView`是在系统`UIView`上封装的一个横向菜单栏的控件(未来会重构一个更灵活的):

```objective-c
typedef NS_ENUM(NSInteger, CLToolBarStyle) {
    CLToolBarNormalStyle = 0,
    CLToolBarSeparationStyle
};

- (instancetype)initToolBarWithFrame:(CGRect)frame;

@property (nonatomic, assign) CLToolBarStyle cl_toolBarStyle;

@property (nonatomic, assign) BOOL cl_titleAdjustsFontSizeToFitWidth;

@property (nonatomic, strong) NSArray  *cl_titleArray;

@property (nonatomic, strong) UIColor *cl_selectedColor;

@property (nonatomic, strong) UIColor *cl_deselectColor;

@property (nonatomic, strong) UIColor *cl_barBakcgroundColor;

@property (nonatomic, strong) UIColor *cl_bottomLineColor;

@property (nonatomic, strong) UIColor *cl_selectedLineColor;

@property (nonatomic, assign) NSInteger cl_textFont;

@property (nonatomic, assign) CGFloat cl_buttonSpacing;

@property (nonatomic, assign) BOOL cl_isNeedLine;

@property (nonatomic, assign) BOOL cl_isNeedSelectedLine;

@property (nonatomic, getter=currentIndex) NSInteger cl_currentIndex;

#pragma mark - Tool Bar Separation Style Property
@property (nonatomic, strong) UIColor *cl_separationColor;

@property (nonatomic, assign) CGFloat cl_separationWidth;

#pragma mark - Common Method
- (void)cl_reloadData;

- (void)cl_didSelectedButton:(NSInteger)index;

@property (nonatomic, copy) void(^cl_toolBarSelectedBlock)(NSInteger index);
```



关于**CLToolBarListView**的用法, 以前就写过一篇文章, 大家可以去看看[玩转iOS开发：横向滑动条《CLToolBarListView》](https://cainrun.github.io/14729678790305.html).



## CLViewController@

`CLViewController`是对系统`UIViewController`的封装并添加了一些特性:

```objective-c
typedef NS_ENUM(NSInteger, CLViewControllerStyle) {
    
    CLMainViewController = 0, // Default
    CLChildViewController
};

- (instancetype)initCLViewControllerWith:(CLViewControllerStyle)style;
```

### CLViewControllerViewModel@

`CLViewControllerViewModel`是对系统`CLViewController`的`ViewModel`, 需要配合使用:

```objective-c
@property (nonatomic, weak, readonly) CLViewController *cl_viewController;

- (instancetype)initViewControllerViewModelWithController:(CLViewController *)controller;
```



## CLWebViewController@

`CLWebViewController`是对系统`UIViewController` + `WKWebView`的封装并添加了一些特性:

```objective-c
@property (nonatomic, strong, readonly) WKWebView *cl_webView;

- (void)cl_setWebViewUIDelegate:(_Nullable id <WKUIDelegate>)UIDelegate
             navigationDelegate:(_Nullable id <WKNavigationDelegate>)navigationDelegate;
```

### CLWebViewNavigationDelegate

`CLWebViewNavigationDelegate`是`CLWebViewController`的`WKNavigationDelegate`, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLWebViewViewModel *cl_viewModel;

- (instancetype)initWebViewNavigationDelegateWithViewModel:(CLWebViewViewModel *)viewModel;
```

### CLWebViewUIDelegate

`CLWebViewUIDelegate`是`CLWebViewController`的`UIDelegate`, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLWebViewViewModel *cl_viewModel;

- (instancetype)initWebViewUIDelegateWithViewModel:(CLWebViewViewModel *)viewModel;
```

### CLWebViewViewModel

`CLWebViewViewModel`是`CLWebViewController`的`ViewModel`, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLWebViewController *cl_webViewController;

- (instancetype)initWebViewModelWithController:(CLWebViewController *)controller;
```



## UIApplication+CLApplication@

针对`UIKit`的`UIApplication`进行系统外的方法补充:

```objective-c
+ (BOOL)cl_getApplicationLocationPermit;

+ (BOOL)cl_getApplicationAddressBookPermit;

+ (BOOL)cl_getApplicationCameraPermit;

+ (BOOL)cl_getApplicationRemindersPermit;

+ (BOOL)cl_getApplicationPhotosLibraryPermit;

+ (void)cl_getApplicationMicrophonePermitWithBlock:(CLPermissionBlock)block;

+ (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber;

+ (void)cl_sendEmailWithEmailAddress:(NSString *)emailAddress;

+ (void)cl_goToAppSetting;

+ (UIImage *)cl_getApplicationLaunchImage;

+ (CGFloat)cl_getStatusBarHeight;
```



## UIButton+CLButton@

针对`UIKit`的`UIButton`进行系统外的方法补充:

```objective-c
typedef NS_ENUM(NSInteger, CLButtonStarStyle) {
    CLButtonStarStyleBegin = 0,
    CLButtonStarStyleFinish
};

typedef void(^CLButtonStar)(UIButton *cl_starButton, CLButtonStarStyle cl_buttonStarStyle, NSInteger time);

typedef void (^CLButtonAction)(UIButton *sender);

@interface UIButton (CLButton)

@property (nonatomic, assign) UIEdgeInsets cl_clickAreaEdgeInsets;

@property (nonatomic, assign, readonly) BOOL cl_isSubmitting;

#pragma mark - 倒计时方法
- (void)cl_starButtonWithTime:(NSInteger)time
                     complete:(CLButtonStar)complete;

#pragma mark - 添加UIButton点击方法
- (void)cl_addButtonActionComplete:(CLButtonAction)complete;

#pragma mark - 用UIActivityIndicatorView代替文字
- (void)cl_showActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style;

- (void)cl_hideActivityIndicatorView;

#pragma mark - 设置UIButton图片
- (void)cl_setNormalButtonWithImage:(UIImage *)image;

- (void)cl_setNormalButtonImageWithColor:(UIColor *)color;

- (void)cl_setHighlightedButtonWithImage:(UIImage *)image;

- (void)cl_setHighlightedButtonImageWithColor:(UIColor *)color;

- (void)cl_setSelectedButtonWithImage:(UIImage *)image;

- (void)cl_setSelectedButtonImageWithColor:(UIColor *)color;

- (void)cl_setDisabledButtonWithImage:(UIImage *)image;

- (void)cl_setDisabledButtonImageWithColor:(UIColor *)color;

#pragma mark - 设置UIButton背景图片
- (void)cl_setNormalButtonBackgroundImageWithImage:(UIImage *)image;

- (void)cl_setHighlightedButtonBackgroundImageWithImage:(UIImage *)image;

- (void)cl_setSelectedButtonBackgroundImageWithImage:(UIImage *)image;

- (void)cl_setDisabledButtonBackgroundImageWithImage:(UIImage *)image;

#pragma mark - 获取UIButton的图片
- (UIImage *)cl_getNormalButtonImage;

- (UIImage *)cl_getHighlightedButtonImage;

- (UIImage *)cl_getSelectedButtonImage;

- (UIImage *)cl_getDisabledButtonImage;

#pragma mark - 获取UIButton的背景图片
- (UIImage *)cl_getNormalButtonBackgroundImage;

- (UIImage *)cl_getHighlightedButtonBackgroundImage;

- (UIImage *)cl_getSelectedButtonBackgroundImage;

- (UIImage *)cl_getDisabledButtonBackgroundImage;

#pragma mark - 设置UIButton标题
- (void)cl_setNormalButtonWithTitle:(NSString *)title;

- (void)cl_setHighlightedButtonWithTitle:(NSString *)title;

- (void)cl_setSelectedButtonWithTitle:(NSString *)title;

- (void)cl_setDisabledButtonWithTitle:(NSString *)title;

#pragma mark - 获取UIButton标题
- (NSString *)cl_getNormalButtonTitle;

- (NSString *)cl_getHighlightedButtonTitle;

- (NSString *)cl_getSelectedButtonTitle;

- (NSString *)cl_getDisabledButtonTitle;

#pragma mark - 设置UIButton标题
- (void)cl_setNormalTitleWithColor:(UIColor *)color;

- (void)cl_setHighlightedTitleWithColor:(UIColor *)color;

- (void)cl_setSelectedTitleWithColor:(UIColor *)color;

- (void)cl_setDisabledTitleWithColor:(UIColor *)color;

#pragma mark - 获取UIButton标题颜色
- (UIColor *)cl_getNormalButtonTitleColor;

- (UIColor *)cl_getHighlightedButtonTitleColor;

- (UIColor *)cl_getSelectedButtonTitleColor;

- (UIColor *)cl_getDisabledButtonTitleColor;

#pragma mark - 设置UIButton的NSAttributedString标题
- (void)cl_setNormalButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

- (void)cl_setHighlightedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

- (void)cl_setSelectedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

- (void)cl_setDisabledButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

#pragma mark - 获取UIButton标题
- (NSAttributedString *)cl_getNormalButtonAttributedStringTitle;

- (NSAttributedString *)cl_getHighlightedButtonAttributedStringTitle;

- (NSAttributedString *)cl_getSelectedButtonAttributedStringTitle;

- (NSAttributedString *)cl_getDisabledButtonAttributedStringTitle;
```



## UICollectionView+CLCollectionView@

针对`UIKit`的`UICollectionView`进行系统外的方法补充:

### UICollectionView占位图代理@

```objective-c
@protocol CLCollectionViewPlaceholderDelegate <NSObject>

@required

- (UIView *)cl_placeholderView;

@optional

- (BOOL)cl_scrollEnabledWithShowPlaceholderView;

@end
```


### UICollectionView刷新@

```objective-c
- (void)cl_reloadData;

- (void)cl_removePlaceholderViewWithSuperView;
```



## UIColor+CLColor@

针对`UIKit`的`UIColor`进行系统外的方法补充:

```objective-c
+ (UIColor *)cl_getARC4RandomColor;

+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue;

+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue
                       alpha:(CGFloat)alphaValue;

+ (UIColor *)cl_colorWithHexString:(NSString *)hexString;

+ (UIColor *)cl_colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alphaValue;

+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue;

+ (UIColor *)cl_configGradientWithBeginColor:(UIColor *)beginColor
                                    endColor:(UIColor *)endColor
                                      height:(CGFloat)height;
```



## UIControl+CLControl@

针对`UIKit`的`UIControl`进行系统外的方法补充:

```objective-c
typedef void(^CLControlAction)(id sender);

@interface CLControlActionBlockObject : NSObject

@property (nonatomic, copy) CLControlAction cl_controlAction;

@property (nonatomic, assign) UIControlEvents cl_controlEvents;

- (void)cl_controlInvokeBlock:(id)sender;

@end

@interface UIControl (CLControl)

- (void)cl_addControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(CLControlAction)complete;

- (void)cl_setControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(CLControlAction)complete;

- (void)cl_removeControlActionWithEvents:(UIControlEvents)controlEvents;

- (void)cl_removeAllActions;

@end
```



## UIDevice+CLDevice@

针对`UIKit`的`UIDevice`进行系统外的方法补充:


### 设备相关@

```objective-c
+ (NSString *)cl_getSystemVersion;

+ (NSString *)cl_getDeviceName;

+ (NSString *)cl_getDeviceModelType;

+ (NSString *)cl_getUUIDString;

+ (NSString *)cl_getCurrentDeviceModelName;

+ (BOOL)cl_isPad;

+ (BOOL)cl_isSimulator;

+ (BOOL)cl_isJailbroken;
```


### CPU相关@

```objective-c
+ (NSUInteger)cl_getCurrentDeviceCPUCount;

+ (CGFloat)cl_getCurrentDeviceAllCoreCPUUse;

+ (NSArray *)cl_getCurrentDeviceSingleCoreCPUUse;
```


### 网络相关@

```objective-c
+ (NSString *)cl_getCarrierName;

+ (NSString *)cl_getCurrentRadioAccessTechnology;

+ (NSString *)cl_getCurrentDeviceIPAddresses;

+ (NSString *)cl_getCurrentDeviceIPAddressWithWiFi;

+ (NSString *)cl_getCurrentDeviceIPAddressWithCell;
```



### 存储相关@

```objective-c
+ (int64_t)cl_getDiskSpace;

+ (int64_t)cl_getDiskSpaceFree;

+ (int64_t)cl_getDiskSpaceUsed;
```



### 内存相关@

```objective-c
+ (int64_t)cl_getMemoryTotal;

+ (int64_t)cl_getMemoryFree;

+ (int64_t)cl_getMemoryActive;

+ (int64_t)cl_getMemoryInactive;

+ (int64_t)cl_getMemoryWired;

+ (int64_t)cl_getMemoryPurgable;
```



## UIFont+CLFont@

针对`UIKit`的`UIFont`进行系统外的方法补充:

```objective-c
+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)cl_fitBoldSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)cl_fitItalicSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2);

+ (UIFont *)cl_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0);

+ (BOOL)cl_loadFontWithPath:(NSString *)path;

+ (void)cl_unloadFontWithPath:(NSString *)path;

+ (UIFont *)cl_loadFontWithData:(NSData *)data;

+ (BOOL)cl_unloadFontWithData:(UIFont *)font;

+ (UIFont *)cl_fitCustomFontWithName:(NSString *)name
                            fontSize:(CGFloat)fontSize;
```



## UIImage+CLImage@

针对`UIKit`的`UIImage`进行系统外的方法补充:


### 生成指定颜色的图片@

```objective-c
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                       completion:(CLImage)completion;

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                       completion:(CLImage)completion;

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                           radius:(CGFloat)radius
                       completion:(CLImage)completion;

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                           radius:(CGFloat)radius
                       completion:(CLImage)completion;
```


### 截取指定视图大小的截图@

```objective-c
+ (UIImage *)cl_getImageForView:(UIView *)view;
```


### 缩放指定比例的图片@

```objective-c
+ (void)cl_asyncDrawImageToSize:(CGSize)size
                          image:(UIImage *)image
                     completion:(CLImage)completion;
```


### 加载GIF图片@

```objective-c
+ (void)cl_asyncLoadGIFImageForName:(NSString *)name
                         completion:(CLImage)completion;

+ (void)cl_asyncLoadGIFImageWithData:(NSData *)data
                          completion:(CLImage)completion;

+ (BOOL)cl_isAnimatedGIFWithData:(NSData *)data;

+ (BOOL)cl_isAnimatedGIFWithFilePath:(NSString *)filePath;
```


### 生成二维码@

```objective-c
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                 completion:(CLImage)completion;

+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                  logoImage:(UIImage *)logoImage
                                 completion:(CLImage)completion;
```


### 生成条形码@

```objective-c
+ (void)cl_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     completion:(CLImage)completion;

+ (void)cl_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     imageSpace:(CGFloat)imageSpace
                                     completion:(CLImage)completion;
```


### 获取图片@

```objective-c
+ (UIImage *)cl_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName;

+ (void)cl_asyncGetVideoPreViewImageWithVideoURL:(NSURL *)videoURL
                                      completion:(CLImage)completion;
```


### 图片高斯模糊处理@

```objective-c
+ (void)cl_asyncBlurImageWithBlur:(CGFloat)blur
                            image:(UIImage *)image
                       completion:(CLImage)completion;
```


### 图片圆角处理@

```objective-c
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                           completion:(CLImage)completion;

+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                           completion:(CLImage)completion;
```

### 图片处理

```objective-c
+ (void)cl_resetSizeWithImage:(UIImage *)image
                         size:(CGSize)size
                   completion:(CLImage)completion;

+ (CGSize)cl_getScaleImageWithImage:(UIImage *)image
                             length:(CGFloat)length;
```



## UINavigationController+CLNavigationController

针对`UIKit`的`UINavigationController`进行系统外的方法补充:

```objective-c
- (UIViewController *)cl_findViewControllerWithClassName:(NSString *)className;

- (NSUInteger)cl_getIndexWithViewController:(UIViewController *)viewController;

- (UIViewController *)cl_getFirstViewController;

- (NSArray *)cl_popToViewControllerWithClassName:(NSString *)className
                                        animated:(BOOL)animated;

- (NSArray *)cl_popToViewControllerWithLevel:(NSUInteger)level
                                    animated:(BOOL)animated;

- (CGFloat)cl_getNavigationBarHeight;
```



## UINavigationItem+CLNavigationItem@

针对`UIKit`的`UINavigationItem`进行系统外的方法补充:

> 这里没有提供外部的API, 内部实现在iOS 11之前修改UINavigationBar backItem的标题, 如果不需要修改的话, 请在CLUIKit.h文件注释#import "UINavigationItem+CLNavigationItem.h"



## UIScreen+CLScreen@

针对`UIKit`的`UIScreen`进行系统外的方法补充:

```objective-c
+ (CGFloat)cl_getScreenScale;

+ (CGSize)cl_getScreenSize;

+ (CGRect)cl_getCurrentScreenBounds;

+ (CGFloat)cl_getScreenWidth;

+ (CGFloat)cl_getScreenHeight;

+ (CGFloat)cl_fitScreen:(CGFloat)value;

+ (CGFloat)cl_getStatusBarHeight;

+ (CGFloat)cl_getNavigationBarHeight;

+ (CGFloat)cl_getTabBarHeight;
```



## UIScrollView+CLScrollView

针对`UIKit`的`UIScrollView`进行系统外的方法补充:

```objective-c
- (void)cl_scrollViewToTopWithAnimated:(BOOL)animated;

- (void)cl_scrollViewToLeftWithAnimated:(BOOL)animated;

- (void)cl_scrollViewToBottomWithAnimated:(BOOL)animated;

- (void)cl_scrollViewToRightWithAnimated:(BOOL)animated;
```



## UITableView+CLTableView@

针对`UIKit`的`UITableView`进行系统外的方法补充:


### UITableView+CLTableView占位代理@

```objective-c
@protocol CLTableViewPlaceholderDelegate <NSObject>

@required

- (UIView *)cl_placeholderView;

@optional

- (BOOL)cl_calculateTableViewHeaderViewFrame;

- (BOOL)cl_scrollEnabledWithShowPlaceholderView;

@end

- (void)cl_removePlaceholderViewWithSuperView;
```



### UITableView+CLTableView刷新@

```objective-c
typedef void(^CLTableViewUpdateBlock)(UITableView *tableView);

- (void)cl_reloadData;


- (void)cl_updateTableViewWithComplete:(CLTableViewUpdateBlock)complete;

- (void)cl_reloadRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

- (void)cl_reloadWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

- (void)cl_reloadWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;
```



### UITableView+CLTableView显示IndexPath

```objective-c
- (void)cl_scrollToIndexPath:(NSIndexPath *)indexPath
              scrollPosition:(UITableViewScrollPosition)scrollPosition
                    animated:(BOOL)animated;

- (void)cl_scrollToRow:(NSUInteger)row
               section:(NSUInteger)section
        scrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated;
```



### UITableView+CLTableView插入IndexPath@

```objective-c
- (void)cl_insertRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

- (void)cl_insertWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

- (void)cl_insertWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

```



### UITableView+CLTableView删除IndexPath@

```objective-c
- (void)cl_deleteRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

- (void)cl_deleteWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

- (void)cl_deleteWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

- (void)cl_resetSelectedRowsAnimated:(BOOL)animated;
```



## UIView+CLView@

针对`UIKit`的`UIView`进行系统外的方法补充:

> 内部实现在iOS 11修改UINavigationBar backItem的标题, 如果不需要修改的话, 请在CLUIKit.h文件注释#import "UIView+CLView.h"



```objective-c
typedef void (^CLGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@property (nonatomic, assign) CGSize cl_size;

@property (nonatomic, assign) CGFloat cl_width;
@property (nonatomic, assign) CGFloat cl_height;
@property (nonatomic, assign) CGFloat cl_top;
@property (nonatomic, assign) CGFloat cl_left;
@property (nonatomic, assign) CGFloat cl_bottom;
@property (nonatomic, assign) CGFloat cl_right;
@property (nonatomic, assign) CGFloat cl_centerX;
@property (nonatomic, assign) CGFloat cl_centerY;

- (void)cl_addTapGestureRecognizerWithBlock:(CLGestureActionBlock)block;

- (void)cl_addLongPressGestureRecognizerWithBlock:(CLGestureActionBlock)block;

- (id)cl_getSubViewWithSubViewClass:(Class)objcClass;

- (id)cl_getSuperViewWithSuperViewClass:(Class)objcClass;

- (BOOL)cl_resignFirstResponder;

- (UIView *)cl_getFirstResponder;

```



## UIViewController+CLViewController@

针对`UIKit`的`UIViewController`进行系统外的方法补充:


### UIViewControllerBackItem检测代理@

```objective-c
@protocol CLNavigationControllerBackItemProtocol <NSObject>
@optional

- (BOOL)cl_navigationShouldPopOnBackButton;

@end
```


### UIViewController+CLViewController方法@

```objective-c
- (BOOL)cl_navigationShouldPopOnBackButton;

- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools;

- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools;

#pragma mark - 呼叫手机
- (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title;

#pragma mark - UIAlertController自定义
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle;

- (void)cl_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(CLAlertControlAction)complete;

- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(CLAlertControlAction)complete;

- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *)actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle;
```

