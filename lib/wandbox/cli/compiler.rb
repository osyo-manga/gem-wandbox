# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"


module Wandbox module CLI
	class Compiler < Thor::Group

		argument :compiler, type: :string, desc: "COMPILER"

		def execute
			name = compiler
			compiler = Wandbox::Compiler.from_compiler_name name
			return puts "Not found '#{name}'." unless compiler
			puts compiler
		end
	end
end end
