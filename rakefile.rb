######################################################################################
# File:: rakefile
# Purpose:: Build tasks for PpmToGdl application
#
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
######################################################################################

require 'rubygems'
require 'psych'
gem 'rdoc', '>= 3.9.4'

require 'rake'
require 'rake/clean'
require 'rdoc/task'
require 'ostruct'
require 'rakeUtils'



# Set the project name
PROJNAME        = "PpmToGdl"

# Bring in the library's version constant
$:.unshift File.expand_path("../lib", __FILE__)
require "ppmtogdl/version"

PKG_VERSION	= PpmToGdl::VERSION
PKG_FILES 	= Dir["**/*"].select { |d| d =~ %r{^(README|bin/|data/|ext/|lib/|spec/|test/)} }

# Setup common clean and clobber targets

CLEAN.include("pkg")
CLOBBER.include("pkg")
#CLEAN.include("#{BUILDDIR}/**/*.*")
#CLOBBER.include("#{BUILDDIR}")

# Setup common directory structure ----------------------------------

#directory BUILDDIR

$verbose = true
	

#############################################################################
#### Imports
# Note: Rake loads imports only after the current rakefile has been completely loaded.

# Load local tasks.
imports = FileList['tasks/**/*.rake']
imports.each do |imp|
	puts "Importing local task file: #{imp}" if $verbose
	import "#{imp}"
end



#############################################################################
#task :init => [BUILDDIR] do
task :init do

end


#############################################################################
RDoc::Task.new(:rdoc) do |rdoc|
    files = ['README.rdoc', 'docs/**/*.rdoc', 'lib/**/*.rb', 'bin/**/*']
    rdoc.rdoc_files.add( files )
    rdoc.main = "README.rdoc"           	# Page to start on
	#puts "PWD: #{FileUtils.pwd}"
    rdoc.title = "#{PROJNAME} Documentation"
    rdoc.rdoc_dir = 'doc'                   # rdoc output folder
    rdoc.options << '--line-numbers' << '--all'
end


#############################################################################
SPEC = Gem::Specification.new do |s|
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

