//
//  AddersonViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "AddersonViewController.h"
#import "AddressTableViewCell.h"
#import "LabelTableViewCell.h"
#import "choseAddressView.h"
@interface AddersonViewController ()<addressTableCellDelegate>

@end

@implementation AddersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    _table.backgroundColor = [UIColor whiteColor];
     _addView = [addressHeView instanceView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getPersonAdderss) name:@"address" object:nil];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *cellID = @"cellID";
        LabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LabelTableViewCell" owner:nil options:nil] firstObject];
        }
       
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString *cellID = @"cellID";
        AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AddressTableViewCell" owner:nil options:nil] firstObject];
        }
        
        if (indexPath.row == 1){
            cell.addressTextFiled.placeholder = @"街道、楼牌号等";
            cell.addressNameLabel.text = @"详细地址:";
        }
        else
            cell.addressNameLabel.text = @"设置轻松购";
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
    
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   

    return _addView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.f;
}
-(void)clickCellText:(AddressTableViewCell *)cell{
    NSIndexPath *path = [_table indexPathForCell:cell];
    NSLog(@"%ld",path.row);
  

   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSLog(@"原则");
        [self.view endEditing:YES];
//        [UIView animateWithDuration:0.25 animations:^{
//            self.view.transform =CGAffineTransformMakeScale(0.95, 0.95);
//        }];
        choseAddressView *chooseView = [[choseAddressView alloc] init];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getPersonAdderss{
    CNContactPickerViewController *conPickerController = [[CNContactPickerViewController alloc] init];
    conPickerController.delegate = self;
    [self presentViewController:conPickerController animated:YES completion:nil];
}
/*
#pragma mark 如果实现该方法当选中联系人时就不会再出现联系人的详情界面,如果想要看到联系人的详情界面则不必实现此方法
-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
    NSLog(@"选中某一个联系人时调用");
    
    [self printContactInfo:contact];
}

#pragma mark 同时选中多个联系人
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact *> *)contacts {
    for (CNContact *contact in contacts) {
        NSLog(@"================================================");
        [self printContactInfo:contact];
    }
}

- (void)printContactInfo:(CNContact *)contact {
    NSString *givenName = contact.givenName;
    NSString *familyName = contact.familyName;
    NSLog(@"givenName=%@, familyName=%@", givenName, familyName);
    NSArray * phoneNumbers = contact.phoneNumbers;
    for (CNLabeledValue<CNPhoneNumber*>*phone in phoneNumbers) {
        NSString *label = phone.label;
        CNPhoneNumber *phonNumber = (CNPhoneNumber *)phone.value;
        NSLog(@"label=%@, value=%@", label, phonNumber.stringValue);
    }
}
 */


#pragma mark 注意:想要查看某个联系人信息的详情 则不需要上面的三种方法 直接调用下面的此方法即可
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    NSLog(@"选中某个联系人的某个属性时调用%@", contactProperty.contact.givenName);
    _addView.nameTextFiled.text =[NSString stringWithFormat:@"%@%@",contactProperty.contact.familyName,contactProperty.contact.givenName];
    
    
    CNPhoneNumber *phoneNumber = (CNPhoneNumber *)contactProperty.value;
    _addView.phoneNumberTextFiled.text = phoneNumber.stringValue;
    /*
    NSArray *phonesArr = contactProperty.contact.phoneNumbers;
 
    NSLog(@"数组%@",phonesArr);
    
    for (CNLabeledValue <CNPhoneNumber*>*phone in phonesArr) {
     
        
        
        NSString *phoneText = phone.label;
        CNPhoneNumber *phoneNumber = (CNPhoneNumber *)phone.value;
        NSLog(@"号码信息%@--%@ ",phoneText,phoneNumber);
        NSString *label = phone.label;
        CNPhoneNumber *phonNumber = (CNPhoneNumber *)phone.value;
        NSLog(@"二次label=%@, value=%@", label, phonNumber.stringValue);
        
        _addView.phoneNumberTextFiled.text = [NSString stringWithFormat:@"%@",phonNumber.stringValue];
    }
    */
  
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击空白");
    [self.view endEditing:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
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
