Pod::Spec.new do |s|
  s.name             = "JVFloatingDrawer"
  s.version          = "0.1.0"
  s.summary          = "An extensible floating drawer with a focus on ease of use and aesthetics."
  s.homepage         = "https://github.com/JVillella/JVFloatingDrawer"
  s.screenshots      = ["http://jvillella.github.io/JVFloatingDrawer/Screenshots/open-drawer-1.png",
                        "http://jvillella.github.io/JVFloatingDrawer/Screenshots/open-drawer-2.png",
                        "http://jvillella.github.io/JVFloatingDrawer/Screenshots/open-drawer-landscape.png",
                        "http://jvillella.github.io/JVFloatingDrawer/Screenshots/animated-drawer-open-portrait.gif"]
  s.license          = 'MIT'
  s.author           = { "JVillella" => "julian.villella@hotmail.com" }
  s.source           = { :git => "https://github.com/JVillella/JVFloatingDrawer.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
end
