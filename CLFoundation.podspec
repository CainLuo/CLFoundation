Pod::Spec.new do |spec|

  spec.name         = "CLFoundation"
  spec.version      = "1.3.2"
  spec.summary      = "CLFoundation for iOS"
  spec.homepage     = "https://github.com/CainLuo/CLFoundation"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "CainLuo" => "350116542@qq.com" }
  spec.platform     = :ios, '8.0'
  spec.source       = { :git => "https://github.com/CainLuo/CLFoundation.git", :tag => "#{spec.version}" }
  spec.source_files = 'CLFoundation/*.{h,m}'
  spec.requires_arc = true
  spec.frameworks   = 'UIKit', 'Foundation'
end