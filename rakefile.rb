######################################################################################
# File:: rakefile
# Purpose:: Build tasks for PpmToGdl application
#
# Author::    Jeff McAffee 03/07/2010
#
######################################################################################

require 'bundler/gem_tasks'

require 'rake'
require 'rake/clean'
require 'rdoc/task'



# Set the project name
PROJNAME        = "PpmToGdl"

# Setup common clean and clobber targets

CLEAN.include("pkg")
CLOBBER.include("pkg")

$verbose = true


#############################################################################
desc "Run all tests"
task :test do
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

  TESTDIR = 'test' unless defined? TESTDIR

  $LOAD_PATH.unshift("./")
  $LOAD_PATH.unshift(TESTDIR)
  Dir[File.join(TESTDIR, "*.rb")].each {|file| require File.basename(file) }
  require 'minitest/autorun'
end

