#
# Be sure to run `pod lib lint FVDebugDataBrowser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FVDebugDataBrowser'
  s.version          = '0.1.2'
  s.summary          = 'Easy way to browse app content'

  s.description      = <<-DESC
FVDebugDataBrowser is a dev/debug tool that allow you to read the content inside the app
                       DESC

  s.homepage         = 'https://github.com/Foodvisor/FVDebugDataBrowser'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Fong Zhou' => 'fong.zhou75@gmail.com' }
  s.source           = { :git => 'https://github.com/Foodvisor/FVDebugDataBrowser.git', :tag => s.version.to_s }
  s.swift_version    = '4.2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10'

  s.source_files = 'FVDebugDataBrowser/Classes/**/*'
  
  s.resource_bundles = {
    'FVDebugDataBrowser' => [
        'FVDebugDataBrowser/Assets/*.{storyboard,xib,bundle}'
    ]
  }

end
