# -*- encoding: UTF-8 -*-
require "wandbox/version"
require "wandbox/list"
require "wandbox/web"
require "wandbox/converter"

module Wandbox
	def list
		List.new Web.list
	end
	module_function :list

	def run compiler, code, **opt
		Web.compile opt.merge({compiler: compiler, code: code})
	end
	module_function :run

	def run_by_file filename, **opt
		
	end
end
