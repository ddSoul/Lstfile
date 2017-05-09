//
//  LSTWriteCarInfoVC.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/28.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTWriteCarInfoVC.h"

#import "LSTHeader.h"
#import "LSTApplyForCardHeaderView.h"
#import "LSTTextFieldCell.h"
#import "LSTSelectorCell.h"

#import "LSTHeaderViewUploadManager.h"

static NSString *const kqVehiclePotho = @"车身照片（在车辆左前方45度角的位置拍摄）";
static NSString *const kqDrivingLicenseFront = @"车辆行驶证照片（主页）";
static NSString *const veliceBTitle = @"车辆行驶证照片（副页，核定载人数、总质量页）";


static NSString *const KCreatCountPeople = @"creatCountPeople";
static NSString *const kVehicelPlateColor = @"vehicelPlateColor";
static NSString *const KVehicelNO = @"vehicelNO";
static NSString *const KBlongPeople = @"blongPeople";
static NSString *const kVehicelCode = @"vehicelCode";

@interface LSTWriteCarInfoVC ()<LSTUploadManagerDelegate>

@property (nonatomic, strong) LSTApplyForCardHeaderView *headerView;
@property (nonatomic, strong) UIButton *nextButton;  

@property (nonatomic, strong) LSTHeaderViewUploadManager *manager;

@property (nonatomic, strong) NSMutableArray *headers;

@end

@implementation LSTWriteCarInfoVC

#pragma mark - life clcle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

- (void)setUpViews
{
    self.title = @"填写车辆信息";
    self.view.backgroundColor = [UIColor whiteColor];
//
    self.manager = [[LSTHeaderViewUploadManager alloc] initWithViewController:self Headers:self.headers];
    self.manager.delegate = self;
    self.headerView = self.manager.headerView;
    
    self.tableView.tableHeaderView = self.headerView;
    
    [self setFormDescriptor];
    
    [self.view addSubview:self.nextButton];

    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(50);
    }];

    
}

- (void)setFormDescriptor
{
    XLFormDescriptor *formDescriptor = [XLFormDescriptor formDescriptor];
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSection];
    
    /** 开户人*/
    XLFormRowDescriptor *kRow;
    kRow = [XLFormRowDescriptor formRowDescriptorWithTag:KCreatCountPeople rowType:XLFormRowDescriptorTypeLSTText title:@"开户人"];
    kRow.required = YES;
    [kRow.cellConfigAtConfigure setObject:@"请输入开户人" forKey:@"textField.placeholder"];
    [section addFormRow:kRow];
    
    /** 车牌颜色*/
    XLFormRowDescriptor *carColorRow;
    carColorRow = [XLFormRowDescriptor formRowDescriptorWithTag:kVehicelPlateColor rowType:XLFormRowDescriptorTypeSelectorFDActionSheet title:@"车牌颜色"];
    carColorRow.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@"BLUE" displayText:@"蓝色"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@"YELLOW" displayText:@"黄色"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@"GREEN" displayText:@"绿色"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@"WHITE" displayText:@"白色"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@"BLACK" displayText:@"黑色"]
                            ];
    carColorRow.noValueDisplayText = @"请选择";
    carColorRow.value = [XLFormOptionsObject formOptionsOptionForValue:nil fromOptions:carColorRow.selectorOptions];
    [section addFormRow:carColorRow];
    
    /** 车牌号*/
    XLFormRowDescriptor *carNoRow;
    carNoRow = [XLFormRowDescriptor formRowDescriptorWithTag:KVehicelNO rowType:XLFormRowDescriptorTypeLSTText title:@"车牌号"];
    carNoRow.required = YES;
    [carNoRow.cellConfigAtConfigure setObject:@"请输入车牌号" forKey:@"textField.placeholder"];
    [section addFormRow:carNoRow];
    
    /** 机动车所有人*/
    XLFormRowDescriptor *carPersonRow;
    carPersonRow = [XLFormRowDescriptor formRowDescriptorWithTag:KBlongPeople rowType:XLFormRowDescriptorTypeLSTText title:@"机动车所有人"];
    carPersonRow.required = YES;
    [carPersonRow.cellConfigAtConfigure setObject:@"请输入机动车所有人" forKey:@"textField.placeholder"];
    [section addFormRow:carPersonRow];
    
    /** 车辆识别代码*/
    XLFormRowDescriptor *carCodeoRow;
    carCodeoRow = [XLFormRowDescriptor formRowDescriptorWithTag:kVehicelCode rowType:XLFormRowDescriptorTypeLSTText title:@"车辆识别代码"];
    carCodeoRow.required = YES;
    [carCodeoRow.cellConfigAtConfigure setObject:@"请输入车辆识别代码" forKey:@"textField.placeholder"];
    [section addFormRow:carCodeoRow];
    
    
    [formDescriptor addFormSection:section];
    self.form = formDescriptor;
}

#pragma mark - custom Metheds
- (void)nextTap:(UIButton *)button
{
    XLFormRowDescriptor *holderRowDesc = [self.form formRowWithTag:KCreatCountPeople];
    XLFormRowDescriptor *accountHolderTypeRowDesc = [self.form formRowWithTag:kVehicelPlateColor];
    [accountHolderTypeRowDesc.value formValue];
    
    XLFormRowDescriptor *colorRowDesc = [self.form formRowWithTag:kVehicelCode];
//    self.applyCardOrder.applyCardInfo.vehicleInfo.vehicleColor =
    [colorRowDesc.value formValue];
//    NSLog(@"saveDataAfterChecked %@",self.applyCardOrder.applyCardInfo.vehicleInfo.vehicleColor);
    NSLog(@"______%@_____%@",holderRowDesc.value,accountHolderTypeRowDesc.value);
}

#pragma mark - Custom Accessors 自定义属性
- (NSMutableArray *)headers {
    if (!_headers) {
        NSArray *titles = @[kqVehiclePotho,kqDrivingLicenseFront,veliceBTitle];
        _headers = [NSMutableArray arrayWithArray:[LSTHeader headersWithTitles:titles]];
//        for (LSTHeader *header in _headers) {
//            if ([header.title isEqualToString:kFrontSideOfTheIdentityCard]) {
//                header.imageURL = self.applyCardOrder.applyCardInfo.accountHolderInfo.identityCard.identityCardSideA;
//                header.localPath = self.applyCardOrder.applyCardInfo.accountHolderInfo.identityCard.identityCardSideALocalPath;
//            }else if ([header.title isEqualToString:kReverseSideOfTheIdentityCard]){
//                header.imageURL = self.applyCardOrder.applyCardInfo.accountHolderInfo.identityCard.identityCardSideB;
//                header.localPath = self.applyCardOrder.applyCardInfo.accountHolderInfo.identityCard.identityCardSideBLocalPath;
//            }
//        }
    }
    return _headers;
}
- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton  buttonWithType:UIButtonTypeCustom];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"image_my_bill_unapply"] forState:UIControlStateNormal];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"image_my_bill_apply"] forState:UIControlStateSelected];
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton.layer setCornerRadius:8];
        [_nextButton setClipsToBounds:YES];
        [_nextButton setSelected:YES];
//        [_nextButton setUserInteractionEnabled:NO];
        
        [_nextButton addTarget:self action:@selector(nextTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
