# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"

module Wandbox module CLI
	class Run < Thor::Group

		argument :filenames, type: :array

		class_option :lang,     type: :string, desc: "Programming language. e.g) --lang=C++"
		class_option :compiler, type: :string, desc: "Run compiler. e.g) --compiler=clang-head"
		class_option :stdin,    type: :string, desc: "Output wandbox permanent link."
# 		class_option :option,   type: :string, desc: "Command option."
		class_option :save,     type: :boolean, desc: "Stdin value."
		class_option :"post-parameter", type: :hash,  desc: "POST parameter."

		def execute
			filenames.each{ |filename|
				return puts "File '#{filename}' not found." unless File.exist? filename
			}
			filename, *filenames_ = filenames

			lang     = options[:lang]     || Wandbox.file2lang(filename)
			compiler = options[:compiler] || Wandbox.lang2compiler(lang)["name"]
			if compiler.nil?
				return puts "No supported language."
			end
# 			puts compiler["display-compile-command"].sub(/prog\..+/, filename)
# 			puts "Running by #{compiler}..."

			code = File.open(filename).read
			puts options[:"post-parameter"]
			option = {}
			option[:code] = filenames_.map { |filename|
				{ "file" => filename, "code" => File.open(filename).read }
			}
			option[:stdin] = options[:stdin] || ""
			option[:save]  = options[:save]  || false

			# String to Symbol from key
			option.merge! Hash[options[:"post-parameter"].map{|k,v| [k.to_sym, v] }]

			result = Wandbox.run compiler, code, option

			progfile = "prog#{File.extname filename}"

			if option[:save]
				puts result["url"]
			else
				puts result
				puts "#{result["compiler_message"]}#{result["program_message"]}"
			end
			status = result["status"].to_i
			if status != 0
				exit status
			end
		end
	end
end end
