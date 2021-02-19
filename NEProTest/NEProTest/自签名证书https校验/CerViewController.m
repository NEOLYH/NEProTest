//
//  CerViewController.m
//  NEProTest
//
//  Created by LuLuLu on 2021/2/19.
//

#import "CerViewController.h"

@interface CerViewController ()<NSURLSessionDelegate>

@end

@implementation CerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    [self normalHttps];
}

-(void)normalHttps{
    NSURLRequest * req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://localhost:8089/users"]];
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionTask * task = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@,%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding],error);
    }];
    [task resume];
}


- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    NSLog(@"证书认证");
    //先判断证书是否有效
    if ([[[challenge protectionSpace] authenticationMethod] isEqualToString: NSURLAuthenticationMethodServerTrust]) {
        //证书验证请求
        SecTrustRef serverTrust = [[challenge protectionSpace] serverTrust];
        /**
         *  导入多张CA证书（Certification Authority，支持SSL证书以及自签名的CA）
         */
        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"cert" ofType:@"der"];//自签名证书
        NSData* caCert = [NSData dataWithContentsOfFile:cerPath];
        //可以添加多张证书
        NSArray *caArray = @[caCert];
        //验证规则
        NSMutableArray *policies = [NSMutableArray array];
        [policies addObject:(__bridge_transfer id)SecPolicyCreateBasicX509()];
        SecTrustSetPolicies(serverTrust, (__bridge CFArrayRef)policies);
        NSMutableArray *pinnedCertificates = [NSMutableArray array];
        //进行自签名证书的添加
        for (NSData *certificateData in caArray) {
            [pinnedCertificates addObject:(__bridge_transfer id)SecCertificateCreateWithData(NULL, (__bridge CFDataRef)certificateData)];
        }
        SecTrustSetAnchorCertificates(serverTrust, (__bridge CFArrayRef)pinnedCertificates);
        SecTrustResultType result = -1;
        //通过本地导入的证书来验证服务器的证书是否可信
        SecTrustEvaluate(serverTrust, &result);
        NSURLCredential *credential = [NSURLCredential credentialForTrust:serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
        return [[challenge sender] useCredential: credential
                      forAuthenticationChallenge: challenge];

    }
}

@end
