# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"
require "wandbox/version"
require "wandbox/cli/compiler_list"
require "wandbox/cli/compiler"
require "wandbox/cli/run"

module Wandbox module CLI
	class CLI < Thor
		register CompilerList, "compilerlist", "compiler-list [OPTIONS]...", "Output compiler list."
		tasks["compilerlist"].options = CompilerList.class_options
		map "compiler-list" => "compilerlist"

		register Compiler, "compiler", "compiler [COMPILER] [OPTIONS]...", "Output compiler setting."
		tasks["compiler"].options = Compiler.class_options

		register Run,  "run_", "run [OPTIONS]... [FILES]...", "Run for [FILES] by Wandbox."
		tasks["run_"].options = Run.class_options
		map "run" => "run_"

		desc "version", "Output version"
		def version
			puts Wandbox::VERSION
		end
	end
end end
