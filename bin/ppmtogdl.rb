##############################################################################
# File:: ppmtogdl.rb
# Purpose:: Utility to ...
# 
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'ppmtogdl'
require 'user-choices'

include PpmToGdl

class PpmToGdlApp < UserChoices::Command
    include UserChoices

    
    def initialize()
        super
        @controller = PpmToGdlController.new
    end
    
    
    def add_sources(builder)
        builder.add_source(CommandLineSource, :usage,
                            "Usage: #{$0} [options] SRC_XML_FILE OUTPUT_FILE",
                            "PpmToGdl can parse a PrimaryParameter.xml file and generate GDL ppm definitions from it.",
                            "If SRC_XML_FILE does not end with an xml extension, .xml will be added.")
    end # def add_sources
    
    
    def add_choices(builder)
        # Arguments
        builder.add_choice(:cmdArg, :length=>2) { |command_line|   # Use length to REQUIRE args.
        #builder.add_choice(:cmdArg) { |command_line|
            command_line.uses_arglist
        }
        
        # Switches
        builder.add_choice(:verbose, :type=>:boolean, :default=>false) { |command_line|
            command_line.uses_switch("-v", "--verbose",
                                    "Turn on verbose output.")
        }
        
        # Options
        builder.add_choice(:customer, :type=>:string) { |command_line|
            command_line.uses_option("-c", "--customer ARG",
                                    "Only generate PPMs for XML elements containing ARG in customer attribute.")
        }
        
    end # def add_choices
    
    
    # Execute the PpmToGdl application.
    # This method is called automatically when 'ppmtogdl(.rb)' is executed from the command line.
    def execute
      $LOG.debug "PpmToGdlApp::execute"

      if(@user_choices[:customer])
        @controller.customer = @user_choices[:customer]
      end
      
      if(@user_choices[:verbose])
        @controller.verbose = @user_choices[:verbose]
      end
      
      if(@user_choices[:cmdArg].empty?) # If no cmd line arg...
        @controller.noCmdLineArg()
        return
      end
      
      result = @controller.setFilenames(@user_choices[:cmdArg])
      
      @controller.doSomething()
    end # def execute
        
    
end # class PpmToGdlApp


if $0 == __FILE__
    PpmToGdlApp.new.execute
end    
