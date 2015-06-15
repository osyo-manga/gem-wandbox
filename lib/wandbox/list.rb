# -*- encoding: UTF-8 -*-
require "iolite"

module Wandbox
	class List
		include Enumerable
		include Iolite::Placeholders

		def initialize list
			@list = list
		end

		def each &block
			@list.each &block
		end

		def languages
			map(&arg1["language"]).uniq
		end

		def select_by_language lang
			lang = lang.downcase
			select &arg1["language"].downcase == lang
		end

		def to_ary
			@data
		end
	end
end
