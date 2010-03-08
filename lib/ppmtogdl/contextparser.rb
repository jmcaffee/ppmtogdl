#
#	File: contextParser.rb
#
#	This class will convert XML guideline files to GDL (Guideline Definition Language).
#	
#

require 'rexml/document'
require 'rexml/streamlistener'
require 'xmlUtils/dumpListener'
require 'contextListener'



#################################################
#
# class ContextParser
#
#################################################
class ContextParser

	attr_accessor :context
	
	def initialize(ctx)
    $LOG.debug "ContextParser::initialize()"
		@context			= ctx
		@verbose 			= false
		
	end



	def verbose?()
		return @verbose
	end # verbose?
	
	
	
	
#-------------------------------------------------------------------------------------------------------------#
# setFlag - Set configuration flags
#
# flg	- Array of options or single string option. Currently, only -v: verbose is available
#
#------------------------------------------------------------------------------------------------------------#
	def setFlag(flg)
    $LOG.debug "ContextParser::setFlag( #{flg} )"
		if (flg.class == Array)
			flg.each do |f|
				case f
					when '-v'
						@verbose = true
				end
			end # flg.each
			
			return
		end # if flg
		
		case flg
			when '-v'
				@verbose = true
		end
		
	end

	
#-------------------------------------------------------------------------------------------------------------#
# parse - Parse guideline XML
#
# fname	- Filename of XML file to parse
#
#------------------------------------------------------------------------------------------------------------#
	def parse(fname, dummy)
    $LOG.debug "ContextParser::parse( #{fname}, #{dummy} )"
		puts "Parsing file." unless (!verbose?)
		ctxListener 				= ContextListener.new(@context)
		ctxListener.verbose	= @verbose
		parser = Parsers::StreamParser.new(File.new(fname), ctxListener)
		parser.parse

=begin
		puts "Parsing guideline." unless (!verbose?)
		gdlListener 				= GdlListener.new(@context)
		gdlListener.verbose	= @verbose
		parser = Parsers::StreamParser.new(File.new(fname), gdlListener)
		parser.parse
=end

	end # parse

	
#-------------------------------------------------------------------------------------------------------------#
# dumpResults - Dump collected context info to STDOUT
#
#
#------------------------------------------------------------------------------------------------------------#
	def dumpResults()
    $LOG.debug "ContextParser::dumpResults()"
		@listener.context.dumpPpms()
	end	# dumpResults
	
end	# class ContextParser



