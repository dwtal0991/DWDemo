//
//  NSString+Extection.h
//  TestFunctional
//
//  Created by Wei on 2022/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extection)

+(NSString*)yihomeJsonToIot:(NSDictionary*)yihomeJson did:(NSString*)did iot:(NSDictionary*)iotJsonDic;

@end

NS_ASSUME_NONNULL_END
