# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require 'xmlhash'

Gem::Specification.new do |s|
  s.name        = 'xmlhash'
  s.version     = Xmlhash::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Stephan Kulow']
  s.email       = ['coolo@suse.de']
  s.homepage    = 'http://github.com/coolo/xmlhash'
  s.summary = 'Experimental C extension to parse XML into ruby hash '
  s.description = 'A small C module that wraps libxml2s xmlreader to parse a XML
string into a ruby hash'

  s.required_ruby_version = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.3.6'
  s.add_development_dependency('rake-compiler', ['>= 0'])
  s.add_development_dependency('pkg-config', ['>= 0.9'])
  s.add_development_dependency('json', ['>= 0.5'])
  s.add_development_dependency('minitest')

  s.extensions	<< 'ext/xmlhash/extconf.rb'

  s.files        = Dir.glob('lib/**/*.rb') + Dir.glob('ext/**/*.{rb,h,c}') + %w(README.txt)
  s.require_path = 'lib'

  s.post_install_message = <<-POST_INSTALL_MESSAGE
  ____
/@    ~-.
\/ __ .- | remember to have fun!
 // //  @
  POST_INSTALL_MESSAGE
end
