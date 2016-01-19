Pod::Spec.new do |s|
  s.name = 'Jolt'
  s.version = '2.0.0'
  s.license = 'MIT'
  s.summary = 'Swift + Accelerate + A shameless fork from Surge'
  s.homepage = 'https://github.com/TheArtOfEngineering/Jolt'
  s.authors = { 'Mattt Thompson' => 'm@mattt.me', 'Tyler Cloutier' => 'cloutiertyler@aol.com' }
  s.source = { :git => 'https://github.com/TheArtOfEngineering/Jolt.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'Source/*.swift'

  s.frameworks = 'Accelerate'

  s.requires_arc = true
end
