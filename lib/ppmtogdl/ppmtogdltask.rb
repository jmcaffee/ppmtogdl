##############################################################################
# File:: ppmtogdltask.rb
# Purpose:: Rake Task for running the application
# 
# Author::    Jeff McAffee 03/07/2010
# Copyright:: Copyright (c) 2010, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

require 'ppmtogdl'
class PpmToGdlTask

	def execute(customer, srcPath, destPath, verbose=false)
		filenames = [srcPath, destPath]
		
		app = PpmToGdlController.new
		app.setCompany(customer)
		app.setFilenames(filenames)
		app.setVerbose(verbose)
		app.doSomething()
	end
end # class PpmToGdlTask


