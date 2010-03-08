#
#	File: PpmContextObjs.rb
#
#	These are PrimaryParameters context objects
#	
#



#################################################
#
# class Ppm
#
#################################################
class MPpm
	
	attr_accessor :id
	attr_accessor :name
	attr_accessor :alias
	attr_accessor :varType         # Type attribute - What portion of decision log value comes from: valid values "PRD, CRP, APM
	attr_accessor :dataType        # DataType attribute -numeric, text, money, etc.
	attr_accessor :customer
	
	
	
#	def initialize(name, als, varType, dataType)
#		@name 		= name
#		@alias		= als
#		@varType	= varType
#		@dataType	= dataType
#		
#	end # initialize

	def initialize(name, attributes)
    $LOG.debug "Ppm::initialize( #{name}, #{attributes} )"
    
		@name 		= name
		@alias		= attributes["Name"]
		@varType	= attributes["Type"]
		#@dataType = "UNKNOWN"
		@dataType	= attributes["Datatype"] #if (attributes.has_key?("Datatype"))
		  
    @customer  = attributes["Customer"]
		
      attributes.each do |k, v|
        puts "Attrib[ #{k} ]: #{v}"
      end
		
		case @varType
			when 'APM'
				@varType = "app"
				
			when 'CRP'
				@varType = "crd"
				
			when 'PRD'
				@varType = "prd"
				
		end # varType
			
		
		case @dataType
			when 'Boolean'
				@dataType = "boolean"
				
			when 'Date'
				@dataType = "date"
				
			when 'Money'
				@dataType = "money"
				
			when 'Numeric'
				@dataType = "numeric"
				
			when 'Percentage'
				@dataType = "percentage"
				
			when 'Text'
				@dataType = "text"
				
		end # dataType
			
		
	end # initialize
	
	


end # class Ppm




