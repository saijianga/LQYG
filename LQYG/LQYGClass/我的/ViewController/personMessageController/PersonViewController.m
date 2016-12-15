//
//  PersonViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "PersonViewController.h"
#import "AddersonViewController.h"
@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr = @[@{@"name":@"ID",@"message":@"232434"},@{@"name":@"昵称",@"message":@"xx"},@{@"name":@"性别",@"message":@"男"},@{@"name":@"我的等级",@"message":@"LV1"},@{@"name":@"收货地址",@"message":@""},@{@"name":@"我的二维码",@"message":@""},@{@"name":@"微信号",@"message":@"未绑定"},@{@"name":@"QQ号",@"message":@"已绑定"},@{@"name":@"手机号",@"message":@"未绑定"},];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_table];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *cellID = @"cellID";
        PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
           
                cell = [[[NSBundle mainBundle] loadNibNamed:@"PersonTableViewCell" owner:nil options:nil] objectAtIndex:0];
           
        }
        
        cell.PersonImageView.image = [UIImage imageNamed:@"100"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    else{
        static NSString *cellID1 = @"cellID1";
        PeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
        if (!cell) {
            
                cell = [[[NSBundle mainBundle] loadNibNamed:@"PeTableViewCell" owner:nil options:nil] firstObject];
                }
        cell.PeNameLabel.text = _arr[indexPath.row - 1][@"name"];
        cell.PeMessageLabel.text = _arr[indexPath.row -1][@"message"];
       
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 60;
    }
    else
        return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0)
        {
          [self setHeaderImage];
       }
    else if (indexPath.row == 1){
        
    }
    else if (indexPath.row == 2){
        NameViewController *changName = [[NameViewController alloc] init];
        [self.navigationController pushViewController:changName animated:YES];
    }
    else if (indexPath.row == 3){
        blackView *blackview = [[blackView alloc] init];
    }
    else if (indexPath.row == 5){
        AddersonViewController *addAddressControl = [[AddersonViewController alloc] init];
        [self.navigationController pushViewController:addAddressControl animated:YES];
    }
    
}
#pragma mark 头像设置
-(void)setHeaderImage{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
   UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       
   }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        }
        pickerImage.delegate = self;
        pickerImage.allowsEditing = NO;
        [self presentViewController:pickerImage animated:YES completion:nil];
        
    }];
    UIAlertAction *carmer = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            picker.allowsEditing = YES;
            picker.sourceType = sourceType;
           
            [self presentViewController:picker animated:YES completion:nil];
        }else
        {
            NSLog(@"模拟其中无法打开照相机,请在真机中使用");
        }
        
    }];
    [alert addAction:photo];
    [alert addAction:carmer];
    [alert addAction:cancel];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
            data = UIImagePNGRepresentation(image);
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
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
