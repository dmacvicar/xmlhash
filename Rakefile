# -*- ruby -*-
$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'bundler/gem_tasks'
require 'rake'
require 'rake/testtask'

require 'xmlhash'

task :build do
  system 'gem build xmlhash.gemspec'
end

Rake::TestTask.new do |t|
  t.libs << File.expand_path('test', __dir__)
  t.libs << File.expand_path(__dir__)
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task default: %i[compile test]
gem 'rake-compiler', '>= 0.4.1'
require 'rake/extensiontask'
Rake::ExtensionTask.new('xmlhash')

# vim: syntax=ruby
