Pod::Spec.new do |s|
  s.name = "UIActionSheet+Blocks"
  s.summary = "Use UIActionSheet with blocks instead of a delegate"
  
  s.version = "1.0.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.homepage = "https://github.com/zwopple/UIActionSheet-Blocks"
  s.author = { "Zwopple | Creative Software" => "support@zwopple.com" }
  s.ios.deployment_target = "6.0"
  s.source = { :git => "https://github.com/zwopple/UIActionSheet-Blocks.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.source_files = "UIActionSheet+Blocks/"
  s.frameworks = "UIKit"
  
end