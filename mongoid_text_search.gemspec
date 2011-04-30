# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid_text_search/version"

Gem::Specification.new do |s|
  s.name = "mongoid_text_search"
  s.version = Mongoid::TextSearch::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Steve Randy Tantra"]
  s.email = ["mail@steverandytantra.com"]
  s.homepage = "http://steverandytantra.com"
  s.summary = %q{Simple full text search for Mongoid.}
  s.description = %q{This gem is used in addition to Mongoid gem (up to version 2.0.0), to provide simple full text search function. It takes one or many string or array of strings fields. The strings will be cleaned up and transform into array so they can be indexed. Searching later on will simply partially matches the input keywords with the indexed keywords in the arrays.}

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("mongoid", ">=2.0.0")
end
