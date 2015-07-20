require "wandbox"
require "iolite"
require "json"
require_relative "./list"

module Wandbox
	class Compiler < Hash
		include Iolite::Placeholders
		include Iolite::Adaptor::ToLazy

		def initialize data
			data.each { |key, value| self[key] = value }
		end

		def self.from_compiler_name name
			compiler = Wandbox.list.find_compiler name
			return nil unless compiler
			Compiler.new compiler
		end

		def self.from_json json
			Compiler.new JSON.parse json
		end

		def options
			options = self["switches"].select &arg1["type"] == "single"
			options + self["switches"].select(&arg1["type"] == "select").map(&arg1["options"]).flatten
		end

		def find_option_by_name name
			options.find &arg1["name"] == name
		end

		def to_stdio enable_options=[]
			opts = options
			opts.reject! &arg1["display-flags"].empty?
			opts.sort_by! &arg1["name"]
			width = (opts.max_by(&arg1["name"].length) || { "name" => "" })["name"].length
			
			enable_options_s = enable_options.map(&to_l.find_option_by_name(arg1)).compact.map(&arg1["display-flags"]).join " "
<<"EOS"
[Compiler]:
  #{self["display-name"]}

[Language]:
  #{self["language"]}

[Version]:
  #{self["version"]}

[Compiler command]:
  $ #{self["display-compile-command"]}#{ " " + enable_options_s unless enable_options_s.empty?}
#{
unless opts.empty?
<<"EOS"

[Option list]:
  #{"Option name".ljust width + 1} : Added extra option
#{
			opts.map { |it|
				"  #{it["name"].ljust width + 1} : #{it["display-flags"]}"
			}.join "\n"
}
EOS
end
}
EOS
		end
	end
end
