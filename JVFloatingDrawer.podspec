#
# Be sure to run `pod lib lint JVFloatingDrawer.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JVFloatingDrawer"
  s.version          = "0.1.0"
  s.summary          = "A short description of JVFloatingDrawer."
  s.description      = <<-DESC
                       An optional longer description of JVFloatingDrawer

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/JVillella/JVFloatingDrawer"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "JVillella" => "julian.villella@hotmail.com" }
  s.source           = { :git => "https://github.com/JVillella/JVFloatingDrawer.git", :tag => s.version.to_s }
  

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'JVFloatingDrawer' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
