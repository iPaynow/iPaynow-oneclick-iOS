//
//  ViewController.m
//  IPNOneClickPayDemo
//
//  Created by 黄睿 on 2017/3/31.
//  Copyright © 2017年 ipaynow. All rights reserved.
//

#import "ViewController.h"
#import "IPNOneClickPreSignMessageUtil.h"
#import "IPNOneClickDESUtil.h"
#import "IPNOneClickPayPlugin.h"

//#define  kDEFEncryptKey   @"1gZftJNHfYNp2H151U14oPxm"   //本地

#define  kAppId             @"1458716247308753"
#define  kDEFEncryptKey     @"6yiCyrEdJAyipcMHrxNas6ED"
#define  kDEFSignKey        @"fmpL6H9QIM66tB6TdZQ3UkBzvde5annB"

// 测试人人支付
//#define  kAppId             @"1465901050513813"
//#define  kDEFEncryptKey     @"T4BQD5AaDHRFWMKrnGxyyXym"
//#define  kDEFSignKey        @"nucvQJsLiqRObzusnNPNE9SkNGfNz8Oa"

#define kNote             @"提示"
#define kConfirm          @"确定"

@interface ViewController ()<IPNOneClickPayDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUserId;
@property (weak, nonatomic) IBOutlet UITextField *txtOrderName;
@property (weak, nonatomic) IBOutlet UITextField *txtOrdrAmt;
@property (weak, nonatomic) IBOutlet UITextField *txtOrderDetail;
@property (weak, nonatomic) IBOutlet UITextField *txtMhtReserved;

@property (weak, nonatomic) IBOutlet UIButton *switchResultViewButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [IPNOneClickPayPlugin setIPNStemeColor:[UIColor orangeColor]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showResultView:(UIButton *)sender {
    if (self.switchResultViewButton.selected == NO) {
        [IPNOneClickPayPlugin setIsShowIPNPayResultPage:NO];
    }else{
        [IPNOneClickPayPlugin setIsShowIPNPayResultPage:YES];
    }
    self.switchResultViewButton.selected = !self.switchResultViewButton.selected;

    
}

- (IBAction)btnPayClick:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    IPNOneClickPreSignMessageUtil *preSign=[[IPNOneClickPreSignMessageUtil alloc]init];
    preSign.appId=kAppId;
    preSign.mhtOrderNo=[dateFormatter stringFromDate:[NSDate date]];
    preSign.mhtName=_txtUserId.text;
    preSign.mhtOrderName=_txtOrderName.text;
    preSign.mhtOrderType=@"01";
    preSign.mhtCurrencyType=@"156";
    preSign.mhtOrderAmt=_txtOrdrAmt.text;
    preSign.mhtOrderDetail=_txtOrderDetail.text;
    preSign.mhtOrderStartTime=[dateFormatter stringFromDate:[NSDate date]];
    preSign.notifyUrl=@"http://inowpaysc.nat123.net:20320/smsNotyfy/notify";
    preSign.mhtReserved=_txtMhtReserved.text;
    preSign.userId=_txtUserId.text;
    
    NSString *originStr=[preSign generatePresignMessage];
    NSString *payData=[self getEncryptedStr:originStr];
    

    [IPNOneClickPayPlugin payByData:payData viewController:self delegate:self];
}

-(NSString *)getEncryptedStr:(NSString *)originStr
{
    originStr=[IPNOneClickDESUtil sortString:originStr];
    originStr= [originStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\0"]];
    
    NSString *firstComponent=[NSString stringWithFormat:@"appId=%@",kAppId];
    firstComponent=[IPNOneClickDESUtil encodeBase64String:firstComponent];
    
    NSString *secondCompenent=[IPNOneClickDESUtil TripleDESEncrypt:originStr WithKey:kDEFEncryptKey];
    
    NSString *thirdCompenent=[originStr stringByAppendingFormat:@"&%@",kDEFSignKey ];
    thirdCompenent=[IPNOneClickDESUtil md5Encrypt:thirdCompenent];
    thirdCompenent=[IPNOneClickDESUtil encodeBase64String:thirdCompenent];
    
    NSString *message=[NSString stringWithFormat:@"%@|%@|%@",firstComponent,secondCompenent,thirdCompenent];
    message= (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                   (CFStringRef)message,
                                                                                   NULL,                                                 //跳过字符
                                                                                   (CFStringRef)@"!*'();:@&=+$,/?%#[]", //转换字符
                                                                                   kCFStringEncodingUTF8));
    return message;
}


-(void)oneClickPayPluginResult:(IPNOneClickPayResult)result errorInfo:(NSString *)errorInfo{
    NSString *resultString=nil;
    switch (result) {
        case IPNOneClickPayResultSuccess:
            resultString=@"支付成功";
            break;
        case IPNOneClickPayResultCancel:
            resultString=@"支付被取消";
            break;
        case IPNOneClickPayResultFail:
            resultString=@"支付失败";
            break;
        case IPNOneClickPayResultNetError:
            resultString = @"网络连接出错，请重试";
            break;
        case IPNOneClickPayResultUnknown:
            resultString=@"支付结果未知";
            break;
            
        default:
            break;
    }
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:resultString
                                                    message:errorInfo
                                                   delegate:nil
                                          cancelButtonTitle:kConfirm
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}


//-(BOOL)shouldAutorotate {
//    return YES;
//}
//
//-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscape;
//}
//
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationLandscapeLeft;
//}


@end
