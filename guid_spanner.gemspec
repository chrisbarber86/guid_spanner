# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'guid_spanner'
  s.version = '0.0.1'
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

  if s.respond_to? :specification_version
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0')
    end
  end
end
