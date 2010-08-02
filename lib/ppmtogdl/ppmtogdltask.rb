##############################################################################
# File:: ppmtogdltask.rb
# Purpose:: Rake Task for running the application
# 
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'ppmtogdl'

include PpmToGdl

class PpmToGdlTask

	def execute(customer, srcPath, destPath, verbose=false)
		filenames = [srcPath, destPath]
		raise "Missing source file path." unless (! srcPath.nil? && !srcPath.empty?)
		raise "Missing destination file path." unless (! destPath.nil? && !destPath.empty?)
		
		app = PpmToGdlController.new
		app.customer = customer
		app.setFilenames(filenames)
		app.verbose = verbose
		app.doSomething()
	end
end # class PpmToGdlTask


