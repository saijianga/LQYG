//
//  blackView.m
//  LQYG
//
//  Created by issuser on 2016/11/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "blackView.h"

@implementation blackView

-(instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];

        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 200, self.frame.size.width, 200)];
        [self addSubview:_pickView];
        _pickView.backgroundColor = [UIColor whiteColor];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.showsSelectionIndicator = YES;
        
        //toolbar
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.frame = CGRectMake(0, self.frame.size.height - 200-40, [UIScreen mainScreen].bounds.size.width, 40);
        [toolbar setBarStyle:UIBarStyleBlack];
        [self addSubview:toolbar];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(10, 5, 60, 30);
        [leftButton setTitle:@"取消" forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(cancleButton) forControlEvents:UIControlEventTouchUpInside];
        [toolbar addSubview:leftButton];
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 5, 60, 30);
        [rightButton setTitle:@"确定" forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(sureButton) forControlEvents:UIControlEventTouchUpInside];
        [toolbar addSubview:rightButton];
        
        
        
    }
    return self;
}
#pragma mark 指定pickerview上有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
#pragma mark 每个表盘有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    [self changeSpearatorLineColor];
    NSString *title = nil;
    if (row == 0) {
        title = @"男";
    }
    else
        title = @"女";
    return title;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40.f;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%ld--%ld",row,component);
}
#pragma mark 改变分割线的颜色 ios10下默认的是透明的
-(void)changeSpearatorLineColor{
    for (UIView *speartorView in _pickView.subviews) {
        if (speartorView.frame.size.height < 1) {
            speartorView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        }
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}
-(void)cancleButton{
   [self removeFromSuperview];
}
-(void)sureButton{
    NSLog(@"获取选中的信息");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
