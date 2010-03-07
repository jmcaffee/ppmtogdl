##############################################################################
# File:: testppmtogdlcfg.rb
# Purpose:: Test PpmToGdl class functionality
# 
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'test/unit'   #(1)
require 'flexmock/test_unit'
#require 'testhelper/filecomparer'
require 'logger'

require 'fileutils'

require 'ppmtogdl'

class  TestPpmToGdl < Test::Unit::TestCase #(3)
    include FileUtils
    include FlexMock::TestCase
#-------------------------------------------------------------------------------------------------------------#
# setup - Set up test fixture
#
#------------------------------------------------------------------------------------------------------------#
  def setup
    $LOG = Logger.new(STDERR)
    $LOG.level = Logger::DEBUG
    @baseDir = File.dirname(__FILE__)
    @dataDir = File.join(@baseDir, "data")
    
  end
  
#-------------------------------------------------------------------------------------------------------------#
# teardown - Clean up test fixture
#
#------------------------------------------------------------------------------------------------------------#
  def teardown
  end
  
#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdl_ctor - Test the constructor
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdl_ctor
    target = PpmToGdl.new
    
    assert(nil != target)
  end

#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdl_does_something
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdl_does_something
    
  end
  

end # TestPpmToGdl
