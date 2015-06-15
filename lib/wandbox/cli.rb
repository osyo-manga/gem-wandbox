# -*- encoding: UTF-8 -*-
require "wandbox/cli/cli"

module Wandbox module CLI
	def new
		CLI.new
	end

	def start *args
		CLI.start *args
	end

	module_function :start
	module_function :new
end end
