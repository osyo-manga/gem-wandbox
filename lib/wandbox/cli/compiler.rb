# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"


module Wandbox module CLI
	class Compiler < Thor::Group
		argument     :compiler, type: :string, desc: "Compiler name."
		class_option :options,  type: :string, desc: "Using options. e.g.) --options=warning,c++11"

		def execute
			name = compiler
			compiler = Wandbox::Compiler.from_compiler_name name
			return puts "Not found '#{name}'." unless compiler
			opts = options["options"] || ""
			puts compiler.to_stdio opts.split ","
		end
	end
end end
