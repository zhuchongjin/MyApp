//
//  XLFormVC.m
//  linjinsuo
//
//  Created by mac on 2018/11/27.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "XLFormVC.h"
#import "XLForm.h"
#import "SegmentFormCell.h"
#import "TextViewFormCell.h"
#import "ActionFormCell.h"

NSString *const kSwitchBool = @"switchBool";
NSString *const kSwitchCheck = @"switchCheck";
NSString *const kStepCounter = @"stepCounter";
NSString *const kSlider = @"slider";
NSString *const kSegmentedControl = @"segmentedControl";
NSString *const kCustom = @"custom";
NSString *const kInfo = @"info";
NSString *const kButton = @"button";
NSString *const kImage = @"image";
NSString *const kButtonLeftAligned = @"buttonLeftAligned";
NSString *const kButtonWithSegueId = @"buttonWithSegueId";
NSString *const kButtonWithSegueClass = @"buttonWithSegueClass";
NSString *const kButtonWithNibName = @"buttonWithNibName";
NSString *const kButtonWithStoryboardId = @"buttonWithStoryboardId";

@interface XLFormVC ()
@property(strong,nonatomic)   UIImageView * image;
@property(strong,nonatomic)   UIButton *BackleftButton;

@end

@implementation XLFormVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, screenTopHeight+screenNavHeight)];
    self.image.userInteractionEnabled = YES;
    self.image.backgroundColor = RGB(7,197,83);
    [self.view addSubview:self.image];
    
    // Do any additional setup after loading the view.
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 40.0f;
    [self setBackLeftButton:@""];
    
    

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}


-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeForm];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self){
        [self initializeForm];
    }
    return self;
}
-(void)initializeForm
{
    
    XLFormDescriptor *form;
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"  "];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Other Cells"];
    section.footerTitle = @"组的尾视图";
    
    [form addFormSection:section];
    
    // Switch
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSwitchBool rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Switch是否显示push"];
    [row.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"switchControl.onTintColor"];
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"输入框" rowType:XLFormRowDescriptorTypeText title:@"输入框"];
    [row.cellConfig setObject:@"用户名" forKey:@"textField.placeholder"];
    [row.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"textField.textColor"];
    row.required = YES;  //是否必填
    [section addFormRow:row];

    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"password" rowType:XLFormRowDescriptorTypePassword title:@"密码"];
    row.required = YES;  //是否必填
//    // 设置placeholder的颜色
//    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"密码" attributes:
//                                              @{NSForegroundColorAttributeName:[UIColor greenColor], }];
//     [row.cellConfig setObject:attrString forKey:@"textField.attributedPlaceholder"];
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"selectorPush" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Push 选择地区"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"山东"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"济南"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"临沂"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"河东"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"八湖"]
                            ];
   
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"济南"];
    
    [section addFormRow:row];
    
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"status" rowType:ZNFormRowDescriptorTypeSegment title:@"设备状态:"];
    row.value = @"1";
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"message" rowType:ZNFormRowDescriptorTypeTextView title:@""];
//    [row.cellConfig setObject:@(10) forKey:@"textViewMaxNumberOfCharacters"];
    row.hidden = @YES;
    [section addFormRow:row];
    
    // 提交
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"submit" rowType:ZNFormRowDescriptorTypeSubmitBtn title:@""];
    row.value = @"提交";
    row.action.formSelector = @selector(submitClick);
    [section addFormRow:row];
    
    section.footerTitle = @"foot title";
    

    
    // 行数的增加  删除等
    section = [XLFormSectionDescriptor formSectionWithTitle:@"cell的怎删改查"
                                             sectionOptions: XLFormSectionOptionCanInsert | XLFormSectionOptionCanDelete
                                          sectionInsertMode:XLFormSectionInsertModeButton];
    section.multivaluedAddButton.title = @"Add New Tag";
    section.footerTitle = @"XLFormSectionInsertModeButton sectionType adds a 'Add Item' (Add New Tag) button row as last cell.";
    // set up the row template
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"status" rowType:ZNFormRowDescriptorTypeSegment title:@"设备状态:"];
    row.value = @"1";
//    [[row cellConfig] setObject:@"Tag Name" forKey:@"textField.placeholder"];
    section.multivaluedRowTemplate = row;
    [form addFormSection:section];
    
  
    self.form = form;
    
}

- (void)submitClick{
    
    //获取数据
    NSLog(@"formValues---%@",[self.form formValues]);
    
    //校验
    NSLog(@"errors---%@",[self formValidationErrors]);
    
    if ([self formValidationErrors].count>0) {
        [UIView addMJNotifierWithText:[[self formValidationErrors].firstObject localizedDescription] dismissAutomatically:YES];
        return;
    }
    
}

#pragma mark XLFormDescriptorDelegate
-(void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)rowDescriptor oldValue:(id)oldValue newValue:(id)newValue{
    // super implmentation MUST be called
    [super formRowDescriptorValueHasChanged:rowDescriptor oldValue:oldValue newValue:newValue];
    
    NSLog(@"xlform ------- cell 操作 %@",rowDescriptor.tag);
    if ([rowDescriptor.tag isEqualToString:@"status"]) {
        XLFormRowDescriptor *textViewRowDescriptor = [self.form formRowWithTag:@"message"];
        if ([rowDescriptor.value isEqualToString:@"2"]) {
            textViewRowDescriptor.hidden = @NO;
            
        }else{
            textViewRowDescriptor.hidden = @YES;
        }
    }else if([rowDescriptor.tag isEqualToString:kSwitchBool]){
        NSLog("---%@",rowDescriptor.value);
        
        XLFormRowDescriptor *pushDescriptor = [self.form formRowWithTag:@"selectorPush"];
        if ([LHStringWithFormat(@"%@",pushDescriptor.value) isEqualToString:@"0"]) {
            pushDescriptor.hidden = @NO;
        }else{
            pushDescriptor.hidden = @YES;
        }
    
        
    }
    
}

    
//    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Other Cells"];
//    XLFormSectionDescriptor * section;
//
//    // Basic Information
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Other Cells"];
//    section.footerTitle = @"OthersFormViewController.h";
//    [form addFormSection:section];
//
//    // Switch
//    XLFormRowDescriptor * row = [XLFormRowDescriptor formRowDescriptorWithTag:kSwitchBool rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Switch"];
//    [row.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"switchControl.onTintColor"];
//    [section addFormRow:row];
//    // check
//    [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:kSwitchCheck rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Check"]];
//
//    // step counter
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kStepCounter rowType:XLFormRowDescriptorTypeStepCounter title:@"Step counter"];
//    row.value = @50;
//    [row.cellConfigAtConfigure setObject:@YES forKey:@"stepControl.wraps"];
//    //    [row.cellConfigAtConfigure setObject:@10 forKey:@"stepControl.stepValue"];
//    //    [row.cellConfigAtConfigure setObject:@10 forKey:@"stepControl.minimumValue"];
//    //    [row.cellConfigAtConfigure setObject:@100 forKey:@"stepControl.maximumValue"];
//    [section addFormRow:row];
//
//    // Segmented Control
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSegmentedControl rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"Fruits"];
//    row.selectorOptions = @[@"Apple", @"Orange", @"Pear"];
//    row.value = @"Pear";
//    [section addFormRow:row];
//
//
//    // Slider
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSlider rowType:XLFormRowDescriptorTypeSlider title:@""];
//
//    row.value = @(30);
//    [row.cellConfigAtConfigure setObject:@(100) forKey:@"slider.maximumValue"];
//    [row.cellConfigAtConfigure setObject:@(10) forKey:@"slider.minimumValue"];
//    [row.cellConfigAtConfigure setObject:@(4) forKey:@"steps"];
//    [section addFormRow:row];
//
//    // 图片
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kImage rowType:XLFormRowDescriptorTypeImage title:@"选择图片"];
//    row.height = 100;
//
//
//    row.value = [UIImage imageNamed:@"default_avatar"];
//    [section addFormRow:row];
//
//    // Info cell
//    XLFormRowDescriptor *infoRowDescriptor = [XLFormRowDescriptor formRowDescriptorWithTag:kInfo rowType:XLFormRowDescriptorTypeInfo];
//    infoRowDescriptor.title = @"设备号";
//    infoRowDescriptor.value = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    //    infoRowDescriptor.value = @"5658989";
//    [section addFormRow:infoRowDescriptor];
//
//
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"Buttons"];
//    section.footerTitle = @"Blue buttons will show a message when Switch is ON";
//    [form addFormSection:section];
//
//    // Button
//    XLFormRowDescriptor * buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:kButton rowType:XLFormRowDescriptorTypeButton title:@"Button"];
//    buttonRow.action.formSelector = @selector(didTouchButton:);
//    [section addFormRow:buttonRow];
//
//
//    // Left Button
//    XLFormRowDescriptor * buttonLeftAlignedRow = [XLFormRowDescriptor formRowDescriptorWithTag:kButtonLeftAligned rowType:XLFormRowDescriptorTypeButton title:@"Button with Block"];
//    [buttonLeftAlignedRow.cellConfig setObject:@(NSTextAlignmentNatural) forKey:@"textLabel.textAlignment"];
//    [buttonLeftAlignedRow.cellConfig setObject:@(UITableViewCellAccessoryDisclosureIndicator) forKey:@"accessoryType"];
//
//    __typeof(self) __weak weakSelf = self;
//    buttonLeftAlignedRow.action.formBlock = ^(XLFormRowDescriptor * sender){
//        if ([[sender.sectionDescriptor.formDescriptor formRowWithTag:kSwitchBool].value boolValue]){
//            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Switch is ON", nil)
//                                                                                      message:@"Button has checked the switch value..."
//                                                                               preferredStyle:UIAlertControllerStyleAlert];
//            [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
//                                                                style:UIAlertActionStyleDefault
//                                                              handler:nil]];
//            [self presentViewController:alertController animated:YES completion:nil];
//        }
//        [weakSelf deselectFormRow:sender];
//    };
//    [section addFormRow:buttonLeftAlignedRow];
//
//    // Another Left Button with segue
////    XLFormRowDescriptor * buttonLeftAlignedWithSegueRow = [XLFormRowDescriptor formRowDescriptorWithTag:kButtonWithSegueClass rowType:XLFormRowDescriptorTypeButton title:@"Button with Segue Class"];
////    buttonLeftAlignedWithSegueRow.action.formSegueClass = NSClassFromString(@"UIStoryboardPushSegue");
////    buttonLeftAlignedWithSegueRow.action.viewControllerClass = [MapViewController class];
////    [section addFormRow:buttonLeftAlignedWithSegueRow];
//
//
//    // Button with SegueId
//    XLFormRowDescriptor * buttonWithSegueId = [XLFormRowDescriptor formRowDescriptorWithTag:kButtonWithSegueClass rowType:XLFormRowDescriptorTypeButton title:@"Button with Segue Idenfifier"];
//    buttonWithSegueId.action.formSegueIdentifier = @"MapViewControllerSegue";
//    [section addFormRow:buttonWithSegueId];
//
//
//    // Another Button using Segue
//    XLFormRowDescriptor * buttonWithStoryboardId = [XLFormRowDescriptor formRowDescriptorWithTag:kButtonWithStoryboardId rowType:XLFormRowDescriptorTypeButton title:@"Button with StoryboardId"];
//    buttonWithStoryboardId.action.viewControllerStoryboardId = @"MapViewController";
//
//    [section addFormRow:buttonWithStoryboardId];
//
//    // Another Left Button with segue
//    XLFormRowDescriptor * buttonWithNibName = [XLFormRowDescriptor formRowDescriptorWithTag:kButtonWithNibName
//                                                                                    rowType:XLFormRowDescriptorTypeButton
//                                                                                      title:@"Button with NibName"];
//    buttonWithNibName.action.viewControllerNibName = @"MapViewController";
//    [section addFormRow:buttonWithNibName];
//
//    self.form = form;
//}


-(void)didTouchButton:(XLFormRowDescriptor *)sender
{
    
    if ([[sender.sectionDescriptor.formDescriptor formRowWithTag:kSwitchBool].value boolValue]){
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Switch is ON", nil)
                                                                                  message:@"Button has checked the switch value..."
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    [self deselectFormRow:sender];
}


-(void)disableEnable:(UIBarButtonItem *)button
{
    self.form.disabled = !self.form.disabled;
    [button setTitle:(self.form.disabled ? @"Enable" : @"Disable")];
    [self.tableView endEditing:YES];
    [self.tableView reloadData];
}
















#pragma mark - 设置左图标
-(void)setLeftImage
{
    UIImageView * image1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, screenTopHeight+10, 20, 20)];
    image1.image = [UIImage imageNamed:@"baizuojiantou"];
    //image.backgroundColor  = [UIColor colorWithRed:0xff/255.0 green:0x62/255.0 blue:0x11/255.0 alpha:1];
    [self.image addSubview:image1];
}
#pragma mark - 设置左上角返回功能按钮
- (void)setBackLeftButton:(NSString *)imageName
{
    self.BackleftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.BackleftButton.frame = CGRectMake(10, screenTopHeight+2, 60,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 20, 20)];
    UIImage *image = [UIImage imageNamed:@"arrow_back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageview.image = image;
    [self.BackleftButton addSubview:imageview];
    self.BackleftButton.tintColor = LHWhiteColor;
    [self.image addSubview:self.BackleftButton];
    self.BackleftButton.adjustsImageWhenHighlighted = NO;
    [self.BackleftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 设置左上角定制功能按钮返回功能点击方法
- (void)backClick:(UIButton *)sender
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
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
