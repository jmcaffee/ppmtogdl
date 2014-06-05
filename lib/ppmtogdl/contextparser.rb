#
#	File: contextParser.rb
#
#	This class will convert XML guideline files to GDL (Guideline Definition Language).
#	
#

require 'rexml/document'
require 'rexml/streamlistener'
require 'xmlutils/dumplistener'
require 'contextlistener'


##############################################################################
# Everything is contained in Module	PpmToGdl
module PpmToGdl
	  
	##########################################################################
	# ContextParser class holds all info and state about the current parsing process
	class ContextParser

		attr_accessor :context
		
		def initialize(ctx)
		$LOG.debug "ContextParser::initialize()"
			@context			= ctx
			@verbose 			= false
			
		end


		# Return true if verbose flag is set.
		def verbose?()
			return @verbose
		end # verbose?
		
		
		
		# Set configuration flags
		# flg:: Array of options or single string option. Currently, only -v: verbose is available
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

		
		# Parse guideline XML
		# fname:: Filename of XML file to parse
		def parse(fname)
		$LOG.debug "ContextParser::parse( #{fname} )"
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

		
		# Dump collected context info to STDOUT
		def dumpResults()
		$LOG.debug "ContextParser::dumpResults()"
			@listener.context.dumpPpms()
		end	# dumpResults
		
	end	# class ContextParser


end # module PpmToGdl
