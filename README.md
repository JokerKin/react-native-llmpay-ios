#安装依赖
```
npm i react-native-llmpay-ios
```
#iOS项目配置
你需要使用 CocoaPods，在 ios 目录下新建文件 Podfile：
```
# The target name is most likely the name of your project.
target 'Your Target' do
  # Your 'node_modules' directory is probably in the root of your project,
  # but if not, adjust the `:path` accordingly
  pod 'React', :path => '../node_modules/react-native', :subspecs => [
    'Core',
    'CxxBridge', # Include this for RN >= 0.47
    'DevSupport', # Include this to enable In-App Devmenu if RN >= 0.43
    'RCTText',
    'RCTNetwork',
    'RCTWebSocket', # needed for debugging
    # Add any other subspecs you want to use in your project
  ]
  # Explicitly include Yoga if you are using RN >= 0.42.0
  pod 'yoga', :path => '../node_modules/react-native/ReactCommon/yoga'

  # Third party deps podspec link
  pod 'DoubleConversion', :podspec => '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'glog', :podspec => '../node_modules/react-native/third-party-podspecs/glog.podspec'
  pod 'Folly', :podspec => '../node_modules/react-native/third-party-podspecs/Folly.podspec'

  pod 'react-native-amap3d', path: '../node_modules/react-native-amap3d/lib/ios'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "React"
      target.remove_from_project
    end
  end
end
```
注意：不同的 RN 版本，Podfile 可能需要稍作调整，具体参考 https://facebook.github.io/react-native/docs/integration-with-existing-apps#configuring-cocoapods-dependencies 。

然后运行：
```
pod install
```
