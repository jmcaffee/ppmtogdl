##############################################################################
# File::    contextlistener.rb
# Purpose:: ContextListener 'listens' to the incoming xml steam and parses
#           tokens out of the stream.
#
# Author::    Jeff McAffee 04/30/2015
#
##############################################################################

require 'rexml/streamlistener'
require 'xmlutils/listener'

include REXML

module PpmToGdl
  class ContextListener < Listener

    attr_reader :context

    def initialize(ctx)
    $LOG.debug "ContextListener::initialize()"
      super()
      @context    = ctx
    end

    # Add a PPM variable to the context object
    # attributes:: PPM element attributes
    def openPPM(attributes)
    $LOG.debug "ContextListener::openPPM( #{attributes} )"

      if(@context.options.has_key?("customer") && !@context.options["customer"].empty?)
        return unless (attributes.has_key?("Customer") && attributes["Customer"].include?(@context.options["customer"]))
      end
      ppmAlias  = attributes["Name"]
      confName  = "p" + @context.createValidName(ppmAlias)
      ppm = MPpm.new(confName, attributes)

      @context.ppms[ppmAlias] = ppm
    end # openPPM
  end # class ContextListener
end # module PpmToGdl


