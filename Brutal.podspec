Pod::Spec.new do |s|
  s.name         = "Brutal"
  s.version      = "0.1"
  s.summary      = "Brutal App UIKit SDK"
  s.description  = <<-DESC
    Collect feedback from your users
  DESC
  s.homepage     = "https://github.com/tiagomartinho/brutal-ios-sdk"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Tiago Martinho" => "t.martinho@icloud.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "9.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/tiagomartinho/brutal-ios-sdk.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
