Pod::Spec.new do |s|
  s.name             = "JVFloatingDrawer"
  s.version          = "0.1.0"
  s.summary          = "An extensible floating drawer with a focus on ease of use and aesthetics."
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
end
