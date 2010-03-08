##############################################################################
# File:: ppmtogdlcontroller.rb
# Purpose:: Main Controller object for PpmToGdl utility
# 
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'ktcommon/ktpath'
require 'ktcommon/ktcmdline'
#require 'dir'

class PpmToGdlController

  attr_accessor :verbose
  attr_reader   :customer
  attr_reader   :srcFile
  attr_reader   :destFile
    
  def initialize()
    $LOG.debug "PpmToGdlController::initialize"
    @cfg = PpmToGdlCfg.new.load
    @verbose = false
    @customer = ""
    @srcFile = ""
    @destFile = ""
  end
  

  def doSomething()
    $LOG.debug "PpmToGdlController::doSomething"
    options = {}
    options["customer"] = @customer
    options["verbose"]  = @verbose
      
    docBuilder = GdlDocBuilder.new(options)
    docBuilder.createDocument(@srcFile, Dir.getwd())
    
  end
      
  
  def setCompany(arg)
    $LOG.debug "PpmToGdlController::setCompany( #{arg} )"
    @customer = arg
  end
      
  
  def setVerbose(arg)
    $LOG.debug "PpmToGdlController::setVerbose( #{arg} )"
    @verbose = arg
  end
      
  
  def setFilenames(arg)
    $LOG.debug "PpmToGdlController::setFilenames( #{arg} )"
    @srcFile = arg[0]
    @destFile = arg[1]
  end
      
  
  def noCmdLineArg()
    $LOG.debug "PpmToGdlController::noCmdLineArg"
    #exit "Should never reach here."
  end
      
  
end # class PpmToGdlController


