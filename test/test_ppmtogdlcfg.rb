##############################################################################
# File:: testppmtogdlcfg.rb
# Purpose:: Test PpmToGdlCfg class functionality
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

class  TestPpmToGdlCfg < Test::Unit::TestCase #(3)
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
# test_ppmtogdlcfg_ctor - Test the constructor
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcfg_ctor
    target = PpmToGdlCfg.new(@dataDir)
    
    assert(nil != target)
  end

#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdlcfg_writes_cfg_file
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcfg_writes_cfg_file
    targetFile = File.join(@dataDir, "ppmtogdlcfg.yml")
    rm_rf(targetFile) if(File.exists?(targetFile))
    
    target = PpmToGdlCfg.new(@dataDir)
    target.save
    
    assert(File.exists?(targetFile), "Cfg file not written to disk")
  end
  

#-------------------------------------------------------------------------------------------------------------#
# test_ppmtogdlcfg_reads_cfg_file
#
#------------------------------------------------------------------------------------------------------------#
  def test_ppmtogdlcfg_reads_cfg_file
    targetFile = File.join(@dataDir, "ppmtogdlcfg.yml")
    rm_rf(targetFile) if(File.exists?(targetFile))
    
    expected = "Test Data"
    helper = PpmToGdlCfg.new(@dataDir)
    helper.cfg[:appPath] = expected
    helper.save
    helper = nil
    
    target = PpmToGdlCfg.new(@dataDir)
    target.load
    
    assert(!target.cfg[:appPath].empty?, "Cfg file not read from disk")
    assert(target.cfg[:appPath] == expected, "Cfg file contains incorrect data")
  end
  

end # TestPpmToGdlCfg
