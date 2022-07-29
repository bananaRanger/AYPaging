#
# Be sure to run `pod lib lint AYPaging.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AYPaging'
  s.version          = '1.0.4'
  s.summary          = 'AYPagingView - is a view that displays a horizontal series of stripes or dots.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Customizable view with set of stripes or dots that inform user about current page, selected model, etc.
You can use it, for example, in your onboarding screens, screens collection items, etc.
                       DESC

  s.homepage         = 'https://github.com/bananaRanger/AYPaging'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.changelog	     = 'https://raw.githubusercontent.com/IlyaUA/CocoSuperApp/main/CHANGELOG.md'
  s.author           = { 'Anton Yereshchenko' => 'antonyereshchenko@gmail.com' }
  s.source           = { :git => 'https://github.com/bananaRanger/AYPaging.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version  = '5.0'
  
  s.source_files = 'AYPaging/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AYPaging' => ['AYPaging/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
