# -*- encoding: UTF-8 -*-
require "thor"
require "wandbox"

module Wandbox module CLI
	class Run < Thor::Group

		argument :filenames, type: :array

		class_option :lang,     type: :string, desc: "Programming language. e.g) --lang=C++"
		class_option :compiler, type: :string, desc: "Run compiler. e.g) --compiler=clang-head"
		class_option :stdin,    type: :string, desc: "Output wandbox permanent link."
		class_option :options,  type: :string, desc: "Wandbox options."
		class_option :save,     type: :boolean, desc: "Stdin value."
		class_option :"post-parameter", type: :hash,  desc: "POST parameter."
		class_option :debug,    type: :boolean, desc: ""

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
			param = {}
			param[:code] = filenames_.map { |filename|
				{ "file" => filename, "code" => File.open(filename).read }
			}
			param[:stdin]  = options[:stdin] || ""
			param[:save]   = options[:save]  || false
			param[:options] = options[:options]

			# String to Symbol from key
			param.merge! Hash[options[:"post-parameter"].map{|k,v| [k.to_sym, v] }] if options[:"post-parameter"]

			puts param if options[:debug]
			result = Wandbox.run compiler, code, param

			progfile = "prog#{File.extname filename}"

			if param[:save]
				puts result["url"]
			else
				puts result if options[:debug]
				puts "#{result["compiler_message"]}#{result["program_message"]}"
			end
			status = result["status"].to_i
			if status != 0
				exit status
			end
		end
	end
end end
