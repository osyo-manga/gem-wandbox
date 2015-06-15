# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"
require "wandbox/version"
require "wandbox/cli/list"
require "wandbox/cli/run"

module Wandbox module CLI
	class CLI < Thor
		register List, "list", "list [OPTIONS]...", "Output compiler list."
		tasks["list"].options = List.class_options

		register Run,  "run_", "run [OPTIONS]... [FILES]...", "Run for [FILES] by Wandbox."
		tasks["run_"].options = Run.class_options
		map "run" => "run_"

		desc "version", "Output version"
		def version
			puts Wandbox::VERSION
		end
	end
end end
