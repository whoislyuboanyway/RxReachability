#
# Be sure to run `pod lib lint RxReachability.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxReachability'
  s.version          = '0.1.0'
  s.summary          = 'RxSwift bindings for Reachability'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  RxReachability adds easy to use RxSwift bindings for [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift).
  You can react to network reachability changes and even retry observables when network comes back up.
                         DESC

  s.homepage         = 'https://github.com/ivanbruel/RxReachability'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ivanbruel' => 'ivan.bruel@gmail.com' }
  s.source           = { :git => 'https://github.com/ivanbruel/RxReachability.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ivanbruel'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RxReachability/Classes/**/*'


  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'ReachabilitySwift', '~> 3'
  s.dependency 'RxSwift', '~> 3.3'
  s.dependency 'RxCocoa', '~> 3.3'
end