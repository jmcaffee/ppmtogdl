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


require_relative 'ppmtogdl/version'

require_relative 'ppmtogdl/ppmcontextobjs'
require_relative 'ppmtogdl/ppmcontext'
require_relative 'ppmtogdl/ppmtogdlcfg'
require_relative 'ppmtogdl/contextlistener'
require_relative 'ppmtogdl/contextparser'
require_relative 'ppmtogdl/gdldocbuilder'
require_relative 'ppmtogdl/gdldoc'
require_relative 'ppmtogdl/ppmtogdlcontroller'
require_relative 'ppmtogdl/ppmtogdltask'



