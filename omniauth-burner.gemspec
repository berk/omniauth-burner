# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/burner/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-burner'
  s.version  = OmniAuth::Burner::VERSION
  s.authors  = ['Michael Berkovich']
  s.email    = ['theiceberk@gmail.com']
  s.summary  = 'Burner strategy for OmniAuth'
  s.homepage = 'https://github.com/berk/omniauth-burner'
  s.description = 'Burner strategy for SSO using OmniAuth framework'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.licenses    = 'MIT-LICENSE'

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
end
