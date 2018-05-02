lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require 'xmlhash/version'

Gem::Specification.new do |s|
  s.name        = 'xmlhash'
  s.version     = Xmlhash::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Stephan Kulow']
  s.email       = ['coolo@suse.de']
  s.licenses    = ['MIT']
  s.homepage    = 'http://github.com/coolo/xmlhash'
  s.summary = 'Experimental C extension to parse XML into ruby hash '
  s.description = 'A small C module that wraps libxml2s xmlreader to parse a XML
string into a ruby hash'

  s.required_ruby_version = '>= 2.1'
  s.required_rubygems_version = '>= 1.3.6'
  s.add_development_dependency('json', ['~> 2.1'])
  s.add_development_dependency('minitest', [' ~> 5.11'])
  s.add_development_dependency('pkg-config', ['~> 1.3'])
  s.add_development_dependency('rake-compiler', ['~> 1.0'])
  s.add_development_dependency('rubocop', [' ~> 0.55'])

  s.extensions << 'ext/xmlhash/extconf.rb'

  s.files        = Dir.glob('lib/**/*.rb') + Dir.glob('ext/**/*.{rb,h,c}') + %w[README.md]
  s.require_path = 'lib'

  s.post_install_message = <<-POST_INSTALL_MESSAGE
  ____
/@    ~-.
\/ __ .- | remember to have fun!
 // //  @
  POST_INSTALL_MESSAGE
end
