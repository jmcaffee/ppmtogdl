##############################################################################
# File:: testppmtogdltask.rb
# Purpose:: Test PpmToGdlTask class functionality
# 
# Author::    Jeff McAffee 05/13/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'test/unit'   #(1)
require 'flexmock/test_unit'
#require 'testhelper/filecomparer'
require 'logger'

require 'fileutils'

require 'ppmtogdl'

class  TestPpmToGdlTask < Test::Unit::TestCase #(3)
    include FileUtils
    include FlexMock::TestCase
	
  def task
	@task
  end
  
#-------------------------------------------------------------------------------------------------------------#
# setup - Set up test fixture
#
#------------------------------------------------------------------------------------------------------------#
  def setup
    $LOG = Logger.new(STDERR)
    $LOG.level = Logger::DEBUG
    @baseDir = File.dirname(__FILE__)
    @dataDir = File.join(@baseDir, "data")
    @outputDir = File.join(@dataDir, "output")
	
	@task = PpmToGdlTask.new
	
	if(File.exists?(@outputDir))
		FileUtils.rm_r @outputDir
	end
    
  end
  
#-------------------------------------------------------------------------------------------------------------#
# teardown - Clean up test fixture
#
#------------------------------------------------------------------------------------------------------------#
  def teardown
	@task = nil
  end
  
#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdltask_ctor - Test the constructor
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdltask_ctor
    target = PpmToGdlTask.new
    
    assert(nil != target)
  end

###
# test_ppmtogdltask_execute_raises_exception_when_filenames_invalid

  def test_ppmtogdltask_execute_raises_exception_when_filenames_invalid
    assert(! task.nil?)
	
	customer = "Impac"
	srcPath = ""
	destPath = ""
	verbose = true
	
	begin
		task.execute customer, srcPath, destPath, verbose
		assert(!"Exception expected. Should not get here.")
		
	rescue
	end

	srcPath = "testpath"
	begin
		task.execute customer, srcPath, destPath, verbose
		assert(!"Exception expected. Should not get here.")
		
	rescue
	end

    
  end
  

###
# test_ppmtogdltask_execute

  def test_ppmtogdltask_execute
    assert(! task.nil?)
	
	customer = "Impac"
	srcPath = File.join(@dataDir, "PrimaryParameters.xml")
	destPath = File.join(@outputDir, "#{customer}-ppms.gdl")
	verbose = true
	
	task.execute customer, srcPath, destPath, verbose
	assert(File.exists?(destPath), "File doesn't exists")
    
  end
  

end # TestPpmToGdlTask
