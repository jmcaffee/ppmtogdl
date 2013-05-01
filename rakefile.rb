######################################################################################
# File:: rakefile
# Purpose:: Build tasks for PpmToGdl application
#
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
######################################################################################

require 'rubygems'
require 'rubygems/package_task'
require 'psych'
gem 'rdoc', '>= 3.9.4'

require 'rake'
require 'rake/clean'
require 'rdoc/task'
require 'ostruct'



# Set the project name
PROJNAME        = "PpmToGdl"

PKGDIR          = "pkg"

# Bring in the library's version constant
$:.unshift File.expand_path("../lib", __FILE__)
require "ppmtogdl/version"

PKG_VERSION = PpmToGdl::VERSION
PKG_FILES   = Dir["**/*"].select { |d| d =~ %r{^(README|bin/|data/|ext/|lib/|spec/|test/)} }

# Setup common clean and clobber targets

CLEAN.include("pkg")
CLOBBER.include("pkg")
#CLEAN.include("#{BUILDDIR}/**/*.*")
#CLOBBER.include("#{BUILDDIR}")

# Setup common directory structure ----------------------------------

#directory BUILDDIR

$verbose = true


#############################################################################
#task :init => [BUILDDIR] do
task :init do

end


#############################################################################
RDoc::Task.new(:rdoc) do |rdoc|
    files = ['docs/**/*.rdoc', 'lib/**/*.rb', 'bin/**/*']
    rdoc.rdoc_files.add( files )
    rdoc.main = "docs/README.rdoc"             # Page to start on
  #puts "PWD: #{FileUtils.pwd}"
    rdoc.title = "#{PROJNAME} Documentation"
    rdoc.rdoc_dir = 'doc'                   # rdoc output folder
    rdoc.options << '--line-numbers' << '--all'
end


#############################################################################
desc "List files to be included in gem"
task :pkg_list do
  puts "PKG_FILES (will be included in gem):"
  PKG_FILES.each do |f|
    puts "  #{f}"
  end
end


#############################################################################
spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.summary = "GDL PPM Generator Utility"
  s.name = PROJNAME.downcase
  s.version = PKG_VERSION
  s.requirements << 'none'
  s.bindir = 'bin'
  s.require_path = 'lib'
  #s.autorequire = 'rake'
  s.files = PKG_FILES
  s.executables = "ppmtogdl"
  s.author = "Jeff McAffee"
  s.email = "gems@ktechdesign.com"
  s.homepage = "http://gems.ktechdesign.com"
  s.description = <<EOF
PpmToGdl generates GDL PPM definitions from a PrimaryParameters.xml file.
EOF
end


#############################################################################
Gem::PackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true

  puts "PKG_VERSION: #{PKG_VERSION}"
end


#############################################################################
desc "Run all tests"
task :test => [:init] do
  unless File.directory?('test')
    $stderr.puts 'no test in this package'
    return
  end
  $stderr.puts 'Running tests...'
  begin
    require 'test/unit'
  rescue LoadError
    $stderr.puts 'test/unit cannot loaded.  You need Ruby 1.8 or later to invoke this task.'
  end

  $LOAD_PATH.unshift("./")
  $LOAD_PATH.unshift(TESTDIR)
  Dir[File.join(TESTDIR, "*.rb")].each {|file| require File.basename(file) }
  require 'minitest/autorun'
end


