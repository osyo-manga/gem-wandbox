# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"
# require "iolite"

module Wandbox module CLI
	class List < Thor::Group
		class_option :language, type: :string, desc: "Output [LANGUAGE] compilers."

		def list
			list = Wandbox.list
			if options[:language]
				list = list.select_by_language options[:language]
			end
			puts "Compiler list:"
			list.each {|it|
				puts "  #{it["name"]}"
			}
		end
	end
end end
