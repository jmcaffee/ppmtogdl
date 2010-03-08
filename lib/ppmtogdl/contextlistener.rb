#
#	File: contextListener.rb
#
#	This class is used to convert Primary Parameters XML to GDL
#	
#

require 'rexml/streamlistener'
require 'ppmcontext'
require 'ppmcontextobjs'
require 'xmlutils/listener'

include REXML




#################################################
#
# class ContextListener
#
#################################################
class ContextListener < Listener
	
  attr_reader :context





	def initialize(ctx)
    $LOG.debug "ContextListener::initialize()"
		super()
		@context 		= ctx
	end
	



#-------------------------------------------------------------------------------------------------------------#
# openPPM - Add a PPM variable to the context object
#
# attributes	- PPM element attributes
#
#------------------------------------------------------------------------------------------------------------#
	def openPPM(attributes)
    $LOG.debug "ContextListener::openPPM( #{attributes} )"
    
		if(@context.options.has_key?("customer") && !@context.options["customer"].empty?)
		  return unless (attributes.has_key?("Customer") && attributes["Customer"].include?(@context.options["customer"]))
		end
    ppmAlias 	= attributes["Name"]
		confName 	= "p" + @context.createValidName(ppmAlias)
#		varType  	= attributes["Type"]
#		dataType	= attributes["DataType"] if attributes.has_key?("DataType")

#		dataType = "Text" if nil == dataType
		
#		ppm = Ppm.new(confName, ppmAlias, varType, dataType)
		ppm = MPpm.new(confName, attributes)
		
		@context.ppms[ppmAlias] = ppm

	end	# openPPM




end	# class ContextListener



