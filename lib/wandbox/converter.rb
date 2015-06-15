# -*- encoding: UTF-8 -*-
require "wandbox/list"
require "wandbox"


module Wandbox
	FILE_EXTENTIONS = {
		".cpp" => "C++",
		".c" => "C",
		".d" => "D",
		".rill" => "Rill",
		".hs" => "Haskell",
		".lhs" => "Haskell",
		".cs" => "C#",
		".pl" => "Perl",
		".py" => "Python",
		".rb" => "Ruby",
		".php" => "PHP",
		".erl" => "Erlang",
		".exs" => "Elixir",
		".js" => "JavaScript",
		".coffee" => "CoffeeScript",
		".sql" => "SQL",
		".scala" => "Scala",
		".lua" => "Lua",
		".rs" => "Rust",
		".vim" => "Vim script",
		".bash" => "Bash script",
		".lazy" => "Lazy K",
		".lisp" => "Lisp",
		".pas" => "Pascal",
		".java" => "Java",
		".groovy" => "Groovy",
	}

	def ext2lang ext
		ext = ext.downcase
		FILE_EXTENTIONS[ext]
	end
	module_function :ext2lang

	def file2lang filename
		ext2lang File.extname filename
	end
	module_function :file2lang

	def lang2compilers lang
		Wandbox.list.select_by_language(lang)
	end
	module_function :lang2compilers

	def lang2compiler lang
		lang2compilers(lang).first
	end
	module_function :lang2compiler

	def file2compiler filename
		lang = file2lang filename
		lang2compiler lang if lang
	end
	module_function :file2compiler
end
