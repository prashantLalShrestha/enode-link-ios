Pod::Spec.new do |spec|
  spec.name = "LinkKit"
  spec.version = "1.0.0"
  spec.summary = "LinkKit: Enode's iOS SDK for easier linking of energy devices in iOS apps"

  spec.description = <<-DESC
  LinkKit: Enode's iOS SDK for easier linking of energy devices in iOS apps
                   DESC

  spec.homepage = "https://github.com/prashantLalShrestha/enode-link-ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.authors = { 
    "Prashant Shrestha" => "prashantlurvs@gmail.com" 
  }
  
  spec.ios.deployment_target = '15.1'
  spec.source = {
    :git => "https://github.com/prashantLalShrestha/enode-link-ios.git"
  }
  spec.static_framework = true
  spec.source_files = "**/*.{h,c,m,swift}"
  spec.exclude_files = ["*.xcframework/**/*.h"]
  spec.preserve_paths = [
    "*.xcframework",
    "**/*.h",
    "*.xcframework/**/*.h"
  ]
  spec.vendored_frameworks='LinkKit.xcframework'

  spec.swift_version = "5.4"
  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_COMPILATION_MODE' => 'wholemodule'
  }

end