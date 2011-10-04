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
require 'rakeUtils'

# Setup common directory structure


PROJNAME        = "PpmToGdl"

$:.unshift File.expand_path("../lib", __FILE__)
require "ppmtogdl/version"

PKG_VERSION	= PpmToGdl::VERSION
PKG_FILES 	= Dir["**/*"].select { |d| d =~ %r{^(README|bin/|data/|ext/|lib/|spec/|test/)} }

# Setup common clean and clobber targets

CLEAN.include("pkg")
CLOBBER.include("pkg")
#CLEAN.include("#{BUILDDIR}/**/*.*")
#CLOBBER.include("#{BUILDDIR}")


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
desc "Documentation for building gem"
task :help do
	hr = "-"*79
	puts hr
	puts "Building the Gem"
	puts "================"
	puts
	puts "Use the following command line to build and install the gem"
	puts 
	puts "rake clean gem && gem install pkg\\#{PROJNAME.downcase}-#{PKG_VERSION}.gem -l --no-ri --no-rdoc"
	puts
	puts "See also the build_gem_script task which will create a cmd script to build and install the gem."
	puts
	puts hr
end


#############################################################################
desc "Generate a simple script to build and install this gem"
task :build_gem_script do
	scriptname = "buildgem.cmd"
	if(File.exists?(scriptname))
		puts "Removing existing script."
		rm scriptname
	end
	
	File.open(scriptname, 'w') do |f|
		f << "::\n"
		f << ":: #{scriptname}\n"
		f << "::\n"
		f << ":: Running this script will generate and install the #{PROJNAME} gem.\n"
		f << ":: Run 'rake build_gem_script' to regenerate this script.\n"
		f << "::\n"

		f << "rake clean gem && gem install pkg\\#{PROJNAME.downcase}-#{PKG_VERSION}.gem -l --no-ri --no-rdoc\n"
	end
end


#############################################################################
RDoc::Task.new(:rdoc) do |rdoc|
    files = ['README.rdoc', 'docs/**/*.rdoc', 'lib/**/*.rb', 'app/**/*.rb']
    rdoc.rdoc_files.add( files )
    rdoc.main = "README.rdoc"           	# Page to start on
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

