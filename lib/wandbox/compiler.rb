require "wandbox"
require "iolite"
require "json"
require_relative "./list"

module Wandbox
	class Compiler < Hash
		include Iolite::Placeholders

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

		def to_s
			options = options()
			options.reject! &arg1["display-flags"].empty?
			options.sort_by! &arg1["name"]
			width = options.max_by(&arg1["name"].length)["name"].length
<<"EOS"
Compiler:
  #{self["display-name"]}

language:
  #{self["language"]}

Version:
  #{self["version"]}

Compiler command:
  $ #{self["display-compile-command"]}

Option list:
#{
			" #{"name".ljust width + 1} : added extra option"
			options.map { |it|
				"  #{it["name"].ljust width + 1} : #{it["display-flags"]}"
			}.join "\n"
}
EOS
		end
	end
end
