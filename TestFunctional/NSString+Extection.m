//
//  NSString+Extection.m
//  TestFunctional
//
//  Created by Wei on 2022/8/8.
//

#import "NSString+Extection.h"

@implementation NSString (Extection)

+(NSString*)yihomeJsonToIot:(NSDictionary*)yihomeJson did:(NSString*)did iot:(NSDictionary*)iotJsonDic{
    if(!did)
        return nil;
    NSArray *iotKeysArray = @[@{@"statusLEDSupport":@"status_led"},@{@"imageReverseSupport":@"image_rotation"},@{@"ldcAdjustSupport":@"LDC"},@{@"nightModeAdjustSupport":@"night_led"},@{@"audioMode":@"talk_single"},@{@"audioMode":@"talk_two"},@{@"controlpannelSupport":@"move_control"},@{@"panoramaSupport":@"panorama_photo"},@{@"presetSupport":@"preset"},@{@"motionCruiseSuppport":@"allday_cruise"},@{@"networkMonitorSupport":@"network_info"},@{@"timeSwitchSupport":@"time_poweron"},@{@"localPlaybackSpeedAdjust":@"fast_video"},@{@"timelapseSupport":@"lapse_video"},@{@"roiSupport":@"ROI"},@{@"cloudPlaybackSpeedAdjust":@"fast_video_playback"},@{@"motionDetectSupport":@"motion_detect"},@{@"alarmRegionSupport":@"motion_area"},@{@"babycryDetectionSupport":@"baby_cry"},@{@"humanMovingDetectionSupport":@"human_detect"},@{@"gestureDetectionSupport":@"gestures"},@{@"voiceInteractionSupport":@"voice_cmd"},@{@"abnormalSoundDetectionSupport":@"abnormal_voice"},@{@"motionTrackSupport":@"motion_track_warning"},@{@"h265Support":@"H265"},@{@"lightLEDSupport":@"light_switch"},@{@"pirAlertSupport":@"pir"},@{@"powerSupplyType":@"battery_info"},@{@"Speed2XSupport":@"support_speed_2x"},@{@"faceDetectionSupport":@"face_detection"},@{@"alarmRingSupport":@"alarm_bell"},@{@"babyCamSupport":@"baby_camera"},@{@"humanTrackSupport":@"people_track"}];
    
    if(!yihomeJson){
        return nil;
    }
    NSMutableDictionary *reusltJson = [[NSMutableDictionary alloc]initWithDictionary:iotJsonDic];

    NSDictionary *sourceJson = [yihomeJson mj_JSONObject];
    for(NSString *yihomekey in sourceJson.allKeys){
        
        for(id iotKey in  iotKeysArray){
            if([iotKey isKindOfClass:[NSDictionary class]]){
                NSDictionary *d = (NSDictionary*)iotKey;
                if([yihomekey isEqualToString:d.allKeys.firstObject]){
                    if([yihomekey isEqualToString:@"audioMode"]){
                        NSInteger iv = [sourceJson[yihomekey] integerValue];
                        reusltJson[@"talk_two"] = @{
                            @"ver":@"",
                            @"support":iv == 2?@"y":@"n"
                        };
                        reusltJson[@"talk_single"] = @{
                            @"ver":@"",
                            @"support":iv >= 2?@"y":@"n"
                        };
                        break;
                    }
                                    
                    NSString *value = [sourceJson[yihomekey] boolValue]?@"y":@"n";
                    reusltJson[iotKey[yihomekey]] = @{
                        @"ver":@"",
                        @"support":value
                    };
                }
                
            }
        }
        reusltJson[@"device_info"] = @{
            @"ver":@"",
            @"support":@"y",
            @"model":sourceJson[@"serverModel"],
            @"did":did
        };
        
        //Reset ver
        for(NSDictionary *key in reusltJson.allKeys){
            NSArray *whiteList = @[@"vehicleDetectionSupport",@"animalDetectionSupport",@"motionDetectCommandSupport"];
            NSMutableDictionary *muDic = [reusltJson[key] mutableCopy];
            if(![whiteList containsObject:key])
                muDic[@"ver"] = @"";
            if(muDic[@"ver_qi"])
                muDic[@"ver_qi"] = @"";
            if(muDic[@"ver_fh"])
                muDic[@"ver_fh"] = @"";
            if(muDic[@"ver_sdk"])
                muDic[@"ver_sdk"] = @"";
            reusltJson[key] = muDic;
        }
    }
    return [reusltJson mj_JSONString];
}

@end
