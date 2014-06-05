##############################################################################
# File:: ppmtogdl.rb
# Purpose:: Include file for PpmToGdl library
#
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'find'
require 'logger'
require 'bundler/setup'

if(!$LOG)
  $LOG = Logger.new(STDERR)
  $LOG.level = Logger::ERROR
end

if ENV["DEBUG"] == '1'
  puts "LOGGING: ON due to DEBUG=1"
  $LOG.level = Logger::DEBUG
end

$LOG.info "**********************************************************************"
$LOG.info "Logging started for PpmToGdl library."
$LOG.info "**********************************************************************"


class_files = File.join( File.dirname(__FILE__), 'ppmtogdl', '*.rb')
$: << File.join( File.dirname(__FILE__), 'ppmtogdl')  # Add directory to the include file array.
Dir.glob(class_files) do | class_file |
    require class_file[/\w+\.rb$/]
end


