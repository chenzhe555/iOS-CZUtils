Pod::Spec.new do |s|
  s.name         = "CZUtil"
  s.version      = "0.0.1"
  s.summary      = "iOS-CZUtils"
  s.description  = "iOS-CZUtils类"
  s.homepage     = "https://github.com/chenzhe555/iOS-CZUtils"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "chenzhe555" => "376811578@qq.com" }
  s.source       = { :git => "https://github.com/chenzhe555/iOS-CZUtils.git", :tag => "#{s.version}" }
  s.subspec 'classes' do |one|
    one.subspec 'exception' do |two|
      two.source_files = 'CZUtils/classes/exception/*.{h,m}'
    end
    one.subspec 'router' do |two|
      two.source_files = 'CZUtils/classes/router/*.{h,m}'
    end  
  end
  s.platform = :ios, "9.0"
  s.frameworks = "Foundation", "UIKit"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "CZCategorys", ">= 0.0.1"
end
