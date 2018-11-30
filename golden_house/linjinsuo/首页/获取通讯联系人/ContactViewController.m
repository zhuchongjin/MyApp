//
//  ContactViewController.m
//  linjinsuo
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ContactViewController.h"
#import <ContactsUI/ContactsUI.h>//访问通讯录的头文件



@interface ContactViewController ()<CNContactPickerDelegate>
@property (nonatomic,strong)UIButton *btnGetInfo;
@property (nonatomic,strong)UILabel *labName;
@property (nonatomic,strong)UILabel *labPhone;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleName:@"获取通讯录联系人"];
    [self setBackLeftButton:@""];
    
    [self.view addSubview:self.btnGetInfo];
//    [self.view addSubview:self.labName];
//    [self.view addSubview:self.labPhone];
    
}


- (void)getAddressBookClick{
    // 1. 判读授权
    //    ABAuthorizationStatus authorizationStatus = ABAddressBookGetAuthorizationStatus();
    //    if (authorizationStatus != kABAuthorizationStatusAuthorized) {
    //        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的通讯录\n设置-隐私-通讯录" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
    //        [alart show];
    //        return;
    //
    //    }
    //
    //    ABPeoplePickerNavigationController *nav = [[ABPeoplePickerNavigationController alloc] init];
    //    nav.peoplePickerDelegate = self;
    //    if([[UIDevice currentDevice].systemVersion floatValue]>=8.0){
    //        nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
    //    }
    //    [self presentViewController:nav animated:YES completion:nil];


    //让用户给权限,没有的话会被拒的各位
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusNotDetermined) {
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) {
                NSLog(@"没有授权, 需要去设置中心设置授权");
            }else
            {
                NSLog(@"用户已授权限");
                CNContactPickerViewController * picker = [CNContactPickerViewController new];
                picker.delegate = self;
                // 加载手机号
                if (@available(iOS 9.0, *)) {
                    picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
                } else {
                    // Fallback on earlier versions
                }
                [self presentViewController: picker  animated:YES completion:nil];
            }
        }];
    }

    if (status == CNAuthorizationStatusAuthorized) {

        //有权限时
        CNContactPickerViewController * picker = [CNContactPickerViewController new];
        picker.delegate = self;
        picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
        [self presentViewController: picker  animated:YES completion:nil];
    }
    else{
        NSLog(@"您未开启通讯录权限,请前往设置中心开启");
    }

}


//// 不展开详情   该方法存在的时候不走 获取单人信息 展开详情
//- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
//
//
//}




// 获取单人信息 展开详
// https://www.imooc.com/article/36557
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    
    CNContact *contact = contactProperty.contact;
    NSString *name = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
    CNPhoneNumber *phoneValue= contactProperty.value;
    NSString *phoneNumber = phoneValue.stringValue;
    
    NSString *phoneStr = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneStr = [phoneStr stringByReplacingOccurrencesOfString:@"+86" withString:@""];
    phoneStr = [phoneStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"联系人信息 名字：%@ 电话：%@",name, phoneStr);
    
    [UIView addMJNotifierWithText:LHStringWithFormat(@"联系人信息 名字：%@ 电话：%@",name, phoneStr) dismissAutomatically:YES];
}


/**
 取消选中联系人时调用
 
 @param picker <#picker description#>
 */
- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


////取消选择
//- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
//{
//    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
//    [self displayPerson:person];
//    [self dismissViewControllerAnimated:YES completion:^{}];
//    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
//    return;
//}
//
//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person
//{
//    ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
//    personViewController.displayedPerson = person;
//    [peoplePicker pushViewController:personViewController animated:YES];
//}
//
////获得选中person的信息
//- (void)displayPerson:(ABRecordRef)person
//{
//    NSString *firstName = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    NSString *middleName = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonMiddleNameProperty);
//    NSString *lastname = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
//    NSMutableString *nameStr = [NSMutableString string];
//    if (lastname!=nil) {
//        [nameStr appendString:lastname];
//    }
//    if (middleName!=nil) {
//        [nameStr appendString:middleName];
//    }
//    if (firstName!=nil) {
//        [nameStr appendString:firstName];
//    }
//    
//    NSString* phone = nil;
//    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,kABPersonPhoneProperty);
//    if (ABMultiValueGetCount(phoneNumbers) > 0) {
//        phone = (__bridge_transfer NSString*)ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
//    } else {
//        phone = @"[None]";
//    }
//    
//    //可以把-、+86、空格这些过滤掉
//    NSString *phoneStr = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
//    phoneStr = [phoneStr stringByReplacingOccurrencesOfString:@"+86" withString:@""];
//    phoneStr = [phoneStr stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
////    self.name = nameStr;
////    self.phone = phoneStr;
////    [self.nameText setText:nameStr];
////    [self.phoneText setText:phoneStr];
//}
//
///**
// 逻辑:  在该代理方法中会调出手机通讯录界面, 选中联系人的手机号, 会将联系人姓名以及手机号赋值给界面上的TEXT1和TEXT2两个UITextFiled上.
// 功能: 调用手机通讯录界面, 获取联系人姓名以及电话号码.
// */
//- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
//    
//    CNContact *contact = contactProperty.contact;
//    
//    DLog(@"%@",contactProperty);
//    DLog(@"givenName: %@, familyName: %@", contact.givenName, contact.familyName);
//    
//    self.nameText.text = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
//    if (![contactProperty.value isKindOfClass:[CNPhoneNumber class]]) {
//        DLog(@"提示用户选择11位的手机号");
//        return;
//    }
//    
//    CNPhoneNumber *phoneNumber = contactProperty.value;
//    NSString * Str = phoneNumber.stringValue;
//    NSCharacterSet *setToRemove = [[ NSCharacterSet characterSetWithCharactersInString:@"0123456789"]invertedSet];
//    NSString *phoneStr = [[Str componentsSeparatedByCharactersInSet:setToRemove]componentsJoinedByString:@""];
//    if (phoneStr.length != 11) {
//        
//        DLog(@"提示用户选择11位的手机号");
//    }
//    
//    DLog(@"-=-=%@",phoneStr);
////    self.phoneText.text = phoneStr;
////    self.name = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];;
////    self.phone = phoneStr;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)btnGetInfo{
    
    if (!_btnGetInfo) {
        _btnGetInfo = [UIButton buttonWithFrame:CGRectMake(100, 100, 100, 30) title:@"获取联系人" titleColor:LHRedColor backgroundColor:LHWhiteColor borderColor:LHGrayColor titleFont:LHTitleFont15 cornerRadius:5 Target:self action:@selector(getAddressBookClick)];
    }
    return _btnGetInfo;
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
