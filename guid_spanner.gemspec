# frozen_string_literal: true

version = ''
if ENV['TRAVIS_TAG'] != nil
  puts "CI Branch - '#{ENV['TRAVIS_TAG']}'"
  version = ENV['TRAVIS_TAG']
end

#if the tag version starts with v (e.g. vx.x.x)
if version.downcase.match /^v/
  #trim the v and set the version to x.x.x
  version = version.dup
  version.slice!(0)
elsif ENV['TRAVIS_TAG'] != nil && ENV['TRAVIS_TAG'] != ''
  #allow none release tags to build alpha, beta, dev versions of the gem.
  version = "0.0.0.#{ENV['TRAVIS_TAG']}"
else
  #otherwise it is not a valid release tag so set the version 0.0.0 as it not being released.
  version = '0.0.0'
end

Gem::Specification.new do |s|
  s.name = 'guid_spanner'
  s.version = version
  s.default_executable = 'guid_spanner'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['Nigel Surtees']
  s.date = '2017-08-25'
  s.description = 'A collection of utilities for uuid manipulation'
  s.email = 'nigel.surtees@sage.com'
  s.files = ['Rakefile', 'lib/guid_spanner.rb', 'lib/guid_spanner/guid.rb.rb']
  s.test_files = ['spec/guid_spec.rb']
  s.homepage = 'http://rubygems.org/gems/guid_spanner'
  s.require_paths = ['lib']
  s.rubygems_version = '2.3.0'
  s.summary = 'Guid Spanner!'

  s.add_development_dependency 'bundler', '~> 1.11'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rubocop'
end
