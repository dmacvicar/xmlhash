# -*- ruby -*-
$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'bundler/gem_tasks'
require 'rake'
require 'rake/testtask'

task :build do
  system 'gem build xmlhash.gemspec'
end

Rake::TestTask.new(:test => :compile) do |t|
  t.libs << File.expand_path('../test', __FILE__)
  t.libs << File.expand_path('../', __FILE__)
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task :default => [:compile, :test]
gem 'rake-compiler', '>= 0.4.1'
require 'rake/extensiontask'
Rake::ExtensionTask.new('xmlhash') do |ext|
  ext.lib_dir = 'lib/xmlhash'
end

# vim: syntax=ruby
