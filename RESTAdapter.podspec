Pod::Spec.new do |s|
  s.name             = 'RESTAdapter'
  s.version          = '0.0.9'
  s.summary          = 'Network adapter for Alamofire library implementation with SwiftyJSON parser'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/skibinalexander/RESTAdapter.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Skibin Alexander' => 'skibinalexander@gmail.com' }
  s.source           = { :git => 'https://github.com/skibinalexander/RESTAdapter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = "5.0"
  s.source_files = 'RESTAdapter/Classes/**/*'
  s.dependency 'Alamofire', '~> 5.0'
  s.dependency 'SwiftyJSON', '~> 4.0'
end
