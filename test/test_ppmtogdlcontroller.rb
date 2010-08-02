##############################################################################
# File:: testppmtogdlcontroller.rb
# Purpose:: Test PpmToGdlController class functionality
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

include PpmToGdl

class  TestPpmToGdl < Test::Unit::TestCase #(3)
    include FileUtils
    include FlexMock::TestCase
	
  def ctrl
	@ctrl
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
	
	@ctrl = PpmToGdlController.new
    
  end
  
#-------------------------------------------------------------------------------------------------------------#
# teardown - Clean up test fixture
#
#------------------------------------------------------------------------------------------------------------#
  def teardown
	@ctrl = nil
  end
  
#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdlcontroller_ctor - Test the constructor
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcontroller_ctor
    target = PpmToGdlController.new
    
    assert(nil != target)
  end

#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdlcontroller_does_something
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcontroller_does_something
    assert(! ctrl.nil?)
    
  end
  

#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdlcontroller_customer
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcontroller_customer
    assert(! ctrl.nil?)
	assert(ctrl.customer.empty?)
	
	expected = "fail"
	ctrl.customer = expected
	target = ctrl.customer
	assert(target == expected)
    
  end
  

#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdlcontroller_verbose
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcontroller_verbose
    assert(! ctrl.nil?)
	assert(ctrl.verbose == false)
	
	expected = "fail"
	ctrl.verbose = expected
	target = ctrl.verbose
	assert(target != expected)
	assert(target == false)
    
	expected = true
	ctrl.verbose = expected
	target = ctrl.verbose
	assert(target == expected)
	
	expected = "bad"
	ctrl.verbose = expected
	target = ctrl.verbose
	assert(target == true)

  end
  

end # TestPpmToGdl
