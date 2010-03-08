#
#	File: gdlDocBuilder.rb
#
#	This is a guideline document builder
#	
#

require 'contextParser'
require 'xmlUtils/ruleParser'
require 'gdlDoc'
require 'xmlUtils/lineParser'


#################################################
#
# class GdlDocBuilder
#
#################################################
class GdlDocBuilder
	
	attr_accessor :options
	attr_accessor :context
	


#-------------------------------------------------------------------------------------------------------------#
# initialize - CTor
#
# options	- Document builder options
#
#------------------------------------------------------------------------------------------------------------#
	def initialize(options)
    $LOG.debug "GdlDocBuilder::initialize( #{options} )"
		@options 	= options	
		@context	= PpmContext.new
		@context.setOptions(@options)
	end # initialize
	
	

	
#-------------------------------------------------------------------------------------------------------------#
# createDocument - create a GDL document from an XML document
#
# srcFile	- XML source file
#	rootDor	- root directory
#
#------------------------------------------------------------------------------------------------------------#
	def createDocument(srcFile, rootDir)
    $LOG.debug "GdlDocBuilder::createDocument( #{srcFile}, #{rootDir} )"

		# Setup context object builder
		ctxBuilder = ContextParser.new(@context)
		ctxBuilder.setFlag(@options)

		statusMsg "Creating context based on src file [ #{srcFile} ]."

		ctxBuilder.parse(srcFile, rootDir)

		printMetrics(@context)
		
		
=begin		
		statusMsg "Parsing external variable definitions."

		parseExternalVarDefs(@context)



		statusMsg "Parsing rule data (#{ctxBuilder.context.rules.size.to_s} rules)."

		ruleBuilder = RuleParser.new(@context)
		ruleBuilder.setFlag(@options)
		
		@context.rules.each do |key, rule|
			rule.src = ruleBuilder.parse(rule.xml)
			print "."
		end # rules.each
		puts
=end

#		ctxBuilder.dumpResults


		# Create output file and output src.
		statusMsg "Generating document."
		
		gdlDoc = GdlDoc.new(srcFile, rootDir, @context)
		gdlDoc.setOptions(@options)
		
		genFile = gdlDoc.generate
		
		statusMsg "Document created: #{genFile}"

		#genFile = gdlDoc.generateRenameList
		
		#statusMsg "Rename list document created: #{genFile}"

	end # createDocument
	
	

	
#-------------------------------------------------------------------------------------------------------------#
# statusMsg - output a status message
#
# msg	- Message to output
#
#------------------------------------------------------------------------------------------------------------#
	def statusMsg(msg)
		
		puts
		puts "-} #{msg}"
		puts

	end # statusMsg
	
	

	
#-------------------------------------------------------------------------------------------------------------#
# printMetrics - Print context metrics
#
# ctx	- Context to generate metrics from
#
#------------------------------------------------------------------------------------------------------------#
	def printMetrics(ctx)
    $LOG.debug "GdlDocBuilder::printMetrics()"
		puts "        PPM count: #{ctx.ppms.size.to_s}"
		
	end # printMetrics




#-------------------------------------------------------------------------------------------------------------#
# parseExternalVarDefs - parse predefined GDL variable definition files.
#
# ctx	- context containing variables to update
#
#------------------------------------------------------------------------------------------------------------#
	def parseExternalVarDefs(ctx)
=begin		
		vp = LineParser.new											# Parse externally defined GDL variable definition files.
		vp.parse("R:/common/inc/DPMs.gdl")			# TODO: Allow external var def files to be defined in a config file.
		vp.parse("R:/common/inc/DSMs.gdl")
		vp.parse("R:/common/inc/PPMs.gdl")
		
		vp.dumpResults if $DEBUG
		
		puts "Searching for external PPM definitions." if $DEBUG
		ctx.ppms.each do |key, val|
			if (vp.ppms.has_key?(key))
				ctx.ppms[key] = vp.ppms[key]
				puts "Found match: #{key}" if $DEBUG
			end # if vp.ppms
		end # do
=end
	end # parseExternalVarDefs
	
	

	
end # class GdlDocBuilder




