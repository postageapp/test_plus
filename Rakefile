# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "test_plus"
  gem.homepage = "http://github.com/postageapp/test_plus"
  gem.license = "MIT"
  gem.summary = %Q{Extensions for Test::Unit and Minitest}
  gem.description = %Q{Convenience methods for testing in Ruby and Rails}
  gem.email = "tadman@postageapp.com"
  gem.authors = ["Scott Tadman"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task default: :test
