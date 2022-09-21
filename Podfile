# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'TestFunctional'
project 'TestFunctional.xcodeproj'
platform :ios, '9.0'
#use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

def commonPods
  
    # 其他
    pod 'IQKeyboardManager'
    pod 'JDStatusBarNotification', '~> 1.6.0'
    pod 'iCarousel'
    pod 'TTTAttributedLabel', '2.0.0'

    pod 'MJRefresh'
    pod 'Masonry', '1.1.0'
    pod 'MJExtension', '3.0.17'
    pod 'dsBridge', '3.0.6'
    pod 'ReactiveObjC', '~> 3.1.1'
    pod 'AFNetworking', '~> 4.0'

    pod 'DZNEmptyDataSet'

    pod 'LKDBHelper', '~> 2.2.1'
    pod 'Mantle', '~> 1.5.4'
    pod "KVOMutableArray"
    pod 'FLAnimatedImage'
    pod 'SDWebImage'
    pod 'Reachability'
    pod 'XMLReader'
    pod 'GKPageScrollView' , '1.3.5'
    pod 'ALToastView'
    pod 'AMTumblrHud'
    pod 'KKProgressToolbar'
    pod 'NVHTarGzip'
    pod 'PTEHorizontalTableView'
    pod 'PulsingHalo'
    pod 'PureLayout'
    pod 'SSZipArchive'
    pod 'SwipeView'
    pod 'UITableView+FDTemplateLayoutCell'
    pod 'KVOMutableArray/ReactiveCocoaSupport'
    #pod 'DWBase',  :path => '../XY-IOS-Functional/DWBase/DWBase.podspec'
    pod 'DWBase' , :git => 'https://gitee.com/small_belly_teh/DWBase.git'
    pod 'SnapKit', '4.2.0'

end

target 'TestFunctional' do
    commonPods
    post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)','TARGET_APP_TYPE=1','NS_BLOCK_ASSERTIONS']
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
      end
    end
end


