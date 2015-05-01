#
#	File: ppmContext.rb
#
#	This is a PPM context object
#	
#



##############################################################################
# Everything is contained in Module	PpmToGdl
module PpmToGdl
	  
	##########################################################################
	# PpmContext class holds ppm variable definitions
	class PpmContext
		
		attr_accessor :ppms
		attr_accessor :options
		
		
		def initialize()
		$LOG.debug "PpmContext::initialize()"
			@ppms			= Hash.new
			
			
		end # initialize
		
		
		def setOptions(options)
		  $LOG.debug "PpmContext::setOptions( #{options} )"
		  @options = options
		end
		
		
		# Generate a valid guideline (GDL) ID
		# inname:: name to convert
		def createValidName(inname)
		$LOG.debug "PpmContext::createValidName( #{inname}  )"
			outname = inname.gsub(/[\s\/\\?*#+]/,'')				# Remove illegal chars (replace with underscore).
			outname.gsub!(/_+/,"_")													# Replace consecutive uscores with single uscore.
			outname.gsub!(/\./,"-")													# Replace period with dash.
			outname.gsub!(/[\(\)\$]/,"")									  # Remove L & R Parens, dollar signs.
			outname.gsub!(/\%/,"Perc")											# Replace '%' with Perc.

			outname
		end


		
		def isPpmVar(var)
			isPpm = false
			
			case var.varType
				when 'app'
					isPpm = true
					
				when 'crd'
					isPpm = true
					
				when 'prd'
					isPpm = true
					
			end # case
			
			isPpm
		end # isPpmVar


		# Dump all PPM variables
		def dumpPpms()
		$LOG.debug "PpmContext::dumpPpms()"
			79.times {print "="}
			puts
			puts "PPM DUMP".center(80)
			79.times {print "="}
			puts
			
			if(@ppms.length > 0)
				ppms = @ppms.sort
				ppms.each do |key, ppm|
					puts "#{ppm.name}\t(#{ppm.alias})"
				end
				
			else
				puts "No PPM variables to dump."
			end

			puts ""

		end	# dumpppms

		
	end # class PpmContext

	
end # module PpmToGdl	



