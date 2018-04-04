# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guid_spanner/version'

Gem::Specification.new do |s|
  s.name = 'guid_spanner'
  s.version = GuidSpanner::VERSION

  s.authors = ['Nigel Surtees']
  s.description = 'A collection of utilities for uuid manipulation'
  s.email = 'nigel.surtees@sage.com'
  s.files = Dir.glob("{bin,lib}/**/**/**")
  s.homepage = 'http://rubygems.org/gems/guid_spanner'
  s.require_paths = ['lib']
  s.summary = 'Guid Spanner!'

  s.add_development_dependency 'bundler', '~> 1.11'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'
end
