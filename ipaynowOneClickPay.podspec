Pod::Spec.new do |s|

  
  s.name         = "ipaynowOneClickPay"
  s.version      = "1.1.0"
  s.summary      = "ipaynowOneClickPay SDK"
  s.description  = <<-DESC
                   Help Developer to integrate OneClickPay
                   DESC
  s.homepage     = "http://www.ipaynow.cn"
  s.license      = "MIT"
  s.author       = { "Chuck" => "lipengchang@ipaynow.cn" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/iPaynow/iPaynow-oneclick-iOS.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = "SDK/*.h"
  s.public_header_files = "SDK/*.h"
  s.vendored_libraries = "SDK/iphones+iphonesimulator/*.a"
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.resource = "SDK/*.bundle"
  s.ios.library = "c++"
  
end