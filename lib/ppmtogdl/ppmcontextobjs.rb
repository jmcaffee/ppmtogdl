##############################################################################
# File::    ppmcontextobjs.rb
# Purpose:: PrimaryParameter context objects
#
# Author::    Jeff McAffee 04/30/2015
#
##############################################################################

module PpmToGdl
  ##########################################################################
  # MPpm class describes a PPM object
  class MPpm

    attr_accessor :id
    attr_accessor :name
    attr_accessor :alias
    attr_accessor :varType         # Type attribute - What portion of decision log value comes from: valid values "PRD, CRP, APM
    attr_accessor :dataType        # DataType attribute -numeric, text, money, etc.
    attr_accessor :customer
    attr_accessor :verbose

    def initialize(name, attributes, verbose=false)
    $LOG.debug "Ppm::initialize( #{name}, #{attributes} )"

      @verbose  = verbose
      @name     = name
      @alias    = attributes["Name"]
      @varType  = attributes["Type"]
      #@dataType = "UNKNOWN"
      @dataType = attributes["Datatype"] #if (attributes.has_key?("Datatype"))

      @customer  = attributes["Customer"]

      if(@verbose)
        attributes.each do |k, v|
          puts "Attrib[ #{k} ]: #{v}"
        end
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

        when 'DateTime'
          @dataType = "datetime"

      end # dataType
    end # initialize
  end # class Ppm
end # module PpmToGdl


