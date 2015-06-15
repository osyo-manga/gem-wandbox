# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"

module Wandbox module CLI
	class Run < Thor::Group
		argument :filenames, type: :array

		class_option :language, type: :string,  desc: "Programming language."
		class_option :compiler, type: :string,  desc: "Run compiler."
		class_option :stdin,    type: :string,  desc: "Output wandbox permanent link."
		class_option :save,     type: :boolean, desc: "Stdin value."
# 		class_option :"post-parameter", type: :hash,  desc: "POST parameter."

		def execute
			filenames.each{ |filename|
				return puts "File '#{filename}' not found." unless File.exist? filename
			}
			filename, *filenames_ = filenames

			lang     = options[:language] || Wandbox.file2lang(filename)
			compiler = options[:compiler] || Wandbox.lang2compiler(lang)["name"]
			if compiler.nil?
				return puts "No supported language."
			end
# 			puts compiler["display-compile-command"].sub(/prog\..+/, filename)
# 			puts "Running by #{compiler}..."

			code  = File.open(filename).read
			codes = filenames_.map { |filename|
				{ "file" => filename, "code" => File.open(filename).read }
			}
			stdin = options[:stdin] || ""
			save  = options[:save]  || false
			result = Wandbox.run compiler, code, { codes: codes, stdin: stdin, save: save }

			if save
				puts result["url"]
			else
				puts result.fetch("compiler_message", result["program_message"])
			end
		end
	end
end end
