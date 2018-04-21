Pod::Spec.new do |s|

  s.name         = "CLFoundation"
  s.version      = "1.6.2"
  s.summary      = "CLFoundation of iOS"
  s.homepage     = "https://github.com/CainLuo/CLFoundation"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "CainLuo" => "350116542@qq.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/CainLuo/CLFoundation.git", :tag => "#{s.version}" }
  s.source_files = "CLFoundation", "CLFoundation/**/*.{h,m}"
  s.frameworks   = "UIKit", "Foundation"

end
