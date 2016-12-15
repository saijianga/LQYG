//
//  TabbarViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "TabbarViewController.h"
#import "CYLTabBarControllerConfig.h"
@interface TabbarViewController ()

@property(strong, nonatomic)UITabBarController* tabBarController;
@property(strong, nonatomic)CYLTabBarControllerConfig* CYTabBarController;
@end

@implementation TabbarViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tabBarController = [[UITabBarController alloc] init];
    [_tabBarController willMoveToParentViewController:self];
    [self addChildViewController:_tabBarController];
    [_tabBarController didMoveToParentViewController:self];
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToHomePage:) name:@"JUMPHOMEPAGE" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goShoping:) name:@"goShoping" object:nil];
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goPerson) name:@"goPerson" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkMessage) name:@"checkMessage" object:nil];
    */
    _tabBarController.delegate = self;
    [_tabBarController setViewControllers:[self viewControllers] animated:NO];
    [_tabBarController setSelectedIndex:[self defaultSelectedIndex]];
    [self.view addSubview:_tabBarController.view];
    
    [self tabBarController:_tabBarController didSelectViewController:_tabBarController.selectedViewController];
    // Do any additional setup after loading the view.
}
/*
-(void)jumpToHomePage:(NSNotification *)noticafition{
    
    [self setSelectedIndex:0];
}

- (void)goShoping:(NSNotification *)noticafition{
    [self setSelectedIndex:2];
}

- (void)goPerson{
    [self setSelectedIndex:4];
}

- (void)checkMessage{
    [self setSelectedIndex:3];
}
*/
-(NSUInteger)defaultSelectedIndex {
    return 0;
}

-(NSArray*)viewControllers {
#ifdef DEBUG
    NSLog(@"%@ currently no viewController, please overwrite %s",NSStringFromClass(self.class),__FUNCTION__);
#endif
    
    return nil;
}

-(BOOL)shouldSelectIndex:(NSInteger)index viewController:(UIViewController *)viewController
{
    return YES;
}

-(void)updateNavigationBar {
    UIViewController* selectedVC = [_tabBarController selectedViewController];
    self.navigationItem.leftBarButtonItems = selectedVC.navigationItem.leftBarButtonItems;
    self.navigationItem.rightBarButtonItems = selectedVC.navigationItem.rightBarButtonItems;
    self.navigationItem.backBarButtonItem = selectedVC.navigationItem.backBarButtonItem;
    self.navigationItem.titleView = selectedVC.navigationItem.titleView;
    self.navigationItem.title = selectedVC.navigationItem.title;
    
    self.title = selectedVC.title;
}

-(void)setSelectedIndex:(NSInteger)index {
    [_tabBarController setSelectedIndex:index];
    [self updateNavigationBar];
}

-(NSInteger)selectedIndex {
    return [_tabBarController selectedIndex];
}

#pragma mark - tabbarController delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0) {
    return [self shouldSelectIndex:[tabBarController.viewControllers indexOfObject:viewController] viewController:viewController];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [self updateNavigationBar];
    //    if(tabBarController.selectedIndex == 2 || _tabBarController.selectedIndex == 1 ){
    //        self.navigationController.navigationBarHidden = YES;
    //    }else{
    //        self.navigationController.navigationBarHidden = NO;
    //    }
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers NS_AVAILABLE_IOS(3_0) {
    
}
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0) {
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
