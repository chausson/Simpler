Pod::Spec.new do |s|
  s.name             = 'Simpler'
  s.version          = '0.2.0'
  s.summary          = 'Network framework base on Alamofire in Swift'

  s.homepage         = 'https://github.com/chausson/Simpler'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chausson' => '232564026@qq.com' }
  s.source           = { :git => 'https://github.com/chausson/Simpler.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Simpler/Classes/**/*'
  # s.resources = 'CHNetwork/Assets/**/*'
  
  s.dependency 'HandyJSON', '~> 1.6.0'
  s.dependency 'Result'
  s.dependency 'Alamofire', '~> 4.1'
end
