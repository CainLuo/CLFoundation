#
#  Be sure to run `pod spec lint CLFoundation.podspec' to ensure this is a

Pod::Spec.new do |s|

  s.name         = "CLFoundation"
  s.version      = "1.3.2"
  s.summary      = "A short description of CLFoundation."
  s.homepage     = "https://github.com/CainLuo/CLFoundation"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "CainLuo" => "350116542@qq.com" }

  s.source       = { :git => "https://github.com/CainLuo/CLFoundation.git", :tag => "#{s.version}" }

  s.source_files  = "CLFoundation", "CLFoundation/**/*.{h,m}"

  s.frameworks = "UIKit", "Foundation"
end
