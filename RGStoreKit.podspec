Pod::Spec.new do |spec|
  spec.name         =  'RGStoreKit'
  spec.version      =  '1.0.1'
  spec.summary   =  'RGStoreKit - protocol oriented persistence framework for iOS'
  spec.author = {
    'Ritesh Gupta' => 'rg.riteshh@gmail.com'  
  }
  spec.license          =  'MIT' 
  spec.homepage         =  'https://github.com/riteshhgupta/RGStoreKit'
  spec.source = {
    :git => 'https://github.com/riteshhgupta/RGStoreKit.git',
    :tag => '1.0.1'
  }
  spec.ios.deployment_target = "10.0"
  spec.source_files =  'Source/*.{swift}'
  spec.requires_arc =  true
end
