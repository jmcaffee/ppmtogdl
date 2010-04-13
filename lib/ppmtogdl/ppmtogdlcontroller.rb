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
  attr_reader   :srcPath
  attr_reader   :destPath
    
  def initialize()
    $LOG.debug "PpmToGdlController::initialize"
    @cfg = PpmToGdlCfg.new.load
    @verbose = false
    @customer = ""
    @srcPath = ""
    @destPath = ""
  end
  

  def doSomething()
    $LOG.debug "PpmToGdlController::doSomething"
    options = {}
    options["customer"] = @customer
    options["verbose"]  = @verbose
      
	destFile = ""
	destFile = File.basename(@destPath) unless File.directory?(@destPath)
	if(!destFile.empty?)
		options["destfile"] = destFile
	end
	destDir  = @destPath
	destDir  = File.dirname(@destPath) unless File.directory?(@destPath)
	if(destDir.length() < 1)
		destDir = Dir.getwd()
	end
	options["destdir"] = destDir
	
    docBuilder = GdlDocBuilder.new(options)
    docBuilder.createDocument(@srcPath)
    
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
    @srcPath  = arg[0]
    @destPath = arg[1]
	
	@srcPath  = KtCommon.formatPath(@srcPath, :unix)
	@destPath = KtCommon.formatPath(@destPath, :unix)
  end
      
  
  def noCmdLineArg()
    $LOG.debug "PpmToGdlController::noCmdLineArg"
    #exit "Should never reach here."
  end
      
  
end # class PpmToGdlController


