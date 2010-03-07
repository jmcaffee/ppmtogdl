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

class PpmToGdlController

  attr_accessor :someFlag
  attr_reader   :company
    
  def initialize()
    $LOG.debug "PpmToGdlController::initialize"
    @cfg = PpmToGdlCfg.new.load
    @someFlag = false
    @company = ""
  end
  

  def doSomething()
    $LOG.debug "PpmToGdlController::doSomething"
  end
      
  
  def setCompany(arg)
    $LOG.debug "PpmToGdlController::setCompany( #{arg} )"
    @company = arg
  end
      
  
  def doSomethingWithCmdLineArg(arg)
    $LOG.debug "PpmToGdlController::doSomethingWithCmdLineArg( #{arg} )"
  end
      
  
  def noCmdLineArg()
    $LOG.debug "PpmToGdlController::noCmdLineArg"
  end
      
  
end # class PpmToGdlController


