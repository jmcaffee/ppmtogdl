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
require 'win32ole'

$LOGGING = true   # TODO: Change this flag to false when releasing production build.

if(!$LOG)
    if($LOGGING)
      # Create a new log file each time:
      file = File.open('ppmtogdl.log', File::WRONLY | File::APPEND | File::CREAT | File::TRUNC)
      $LOG = Logger.new(file)
      #$LOG = Logger.new('xledit.log', 2)
      $LOG.level = Logger::DEBUG
      #$LOG.level = Logger::INFO
    else
      $LOG = Logger.new(STDERR)
      $LOG.level = Logger::ERROR
    end
    $LOG.info "**********************************************************************"
    $LOG.info "Logging started for PpmToGdl library."
    $LOG.info "**********************************************************************"
end


class_files = File.join( File.dirname(__FILE__), 'ppmtogdl', '*.rb')
$: << File.join( File.dirname(__FILE__), 'ppmtogdl')  # Add directory to the include file array.
Dir.glob(class_files) do | class_file |
    require class_file[/\w+\.rb$/]
end


