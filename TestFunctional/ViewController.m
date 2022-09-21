//
//  ViewController.m
//  TestFunctional
//
//  Created by Wei on 2020/10/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //D201
    NSString *reuslt = [NSString yihomeJsonToIot:[self reloadDeviceConfig:@"61"]did:@"LFUSY33" iot:[self reloadJsonNameDic:@"A554J"]];
    NSLog(@"result = %@",reuslt);
    // Do any additional setup after loading the view.
}
//获取本地serverModel特定能力集
- (NSDictionary *)reloadDeviceConfig:(NSString*)serverModel {
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Devicesconfig" ofType:@"json"]];
    if (!jsonData) return nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    if (dic){
        NSMutableArray *dics = dic[@"config"];
        for(NSDictionary *dic in dics){
            if([serverModel isEqualToString:[NSString stringWithFormat:@"%@",dic[@"serverModel"]]]){
                return dic;
            }
        }
    }
    return nil;
}

//获取本地Json能力集
- (NSDictionary *)reloadJsonNameDic:(NSString*)jsonName {
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"]];
    if (!jsonData) return nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    return dic;
}


@end
