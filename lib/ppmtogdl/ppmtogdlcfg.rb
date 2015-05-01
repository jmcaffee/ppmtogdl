##############################################################################
# File:: ppmtogdlcfg.rb
# Purpose:: PpmToGdl configuration file reader/writer class.
#
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'ktcommon/ktcfg'

module PpmToGdl
  class PpmToGdlCfg < KtCfg::CfgFile

    attr_accessor :cfg

    def initialize(rootDir=nil)
      $LOG.debug "PpmToGdlCfg::initialize"
      super
      @cfg = {}

      setDefaults()
    end

    def setDefaults
      $LOG.debug "PpmToGdlCfg::setDefaults"
      app_path = ENV["LOCALAPPDATA"]
      app_path ||= ENV["HOME"]
      @cfg[:appPath] = File.rubypath(File.join(app_path, "ppmtogdl"))
    end

    # Load the YAML configuration file.
    # returns:: a hash containing configuration info.
    def load
      $LOG.debug "PpmToGdlCfg::load"
      @cfg = read("ppmtogdlcfg.yml")
    rescue
      # Nothing to read. Leave the defaults.
    end

    # Save the @cfg hash to a YAML file.
    def save
      $LOG.debug "PpmToGdlCfg::save"
      write("ppmtogdlcfg.yml", @cfg)
    end
  end # class PpmToGdlCfg
end # module PpmToGdl
