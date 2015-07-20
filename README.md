# Wandbox

Run Wandbox(http://melpon.org/wandbox/) in CLI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wandbox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wandbox

## Usage

```shell
$ cat test.rb
5.times.each { |n|
	puts n
}
$ wandbox run test.rb
0
1
2
3
4
```

#### Using Boost in C++

Using `--options` option.

```shell
$ cat test.cpp
#include <boost/config.hpp>
#include <iostream>

int
main(){
	std::cout << BOOST_COMPILER << std::endl;
	return 0;
}
$ wandbox run test.cpp --options="boost-1.58"
GNU C++ version 6.0.0 20150711 (experimental)
```

#### Using Clang Compiler

Using `--compiler` option.

```shell
$ cat test.cpp
#include <iostream>

int
main(){
	std::cout << __VERSION__ << std::endl;
	return 0;
}
$ wandbox run test.cpp --compiler=clang-head
4.2.1 Compatible Clang 3.7.0 (trunk 241983)
```

#### Run multiple source files.

```shell
$ cat prog.rb
require_relative "./test"

puts X.method
$ cat test.rb
module X
	def self.method
		"X.method"
	end
end
$ wandbox run prog.rb test.rb
X.method
```

#### Save source code in Wandbox

Using `--save` option.

```shell
$ wandbox run prog.rb --save
http://melpon.org/wandbox/permlink/rCVQCfbdmsqGXaO7
hello world
```

#### Output compiler list

Using `compiler-list` in sub command.

```shell
$ wandbox compiler-list
Compiler list:
  gcc-head
  gcc-5.1.0
  gcc-4.9.2
  gcc-4.9.1
  gcc-4.9.0
  gcc-4.8.2
  gcc-4.8.1
  gcc-4.7.3
  gcc-4.6.4
  gcc-4.5.4
  gcc-4.4.7
  gcc-4.3.6
  clang-head
  clang-3.6
  clang-3.5
  clang-3.4
  clang-3.3
  clang-3.2
  clang-3.1
  clang-3.0
...
```

#### Output compiler options

```shell
$ wandbox compiler gcc-head --options="warning,c++11"
Compiler:
  gcc HEAD

language:
  C++

Version:
  6.0.0 20150718 (experimental)

Compiler command:
  $ g++ prog.cc -Wall -Wextra -std=c++11

Option list:
  boost-1.47           : -I/usr/local/boost-1.47.0/include
  boost-1.48           : -I/usr/local/boost-1.48.0/include
  boost-1.49           : -I/usr/local/boost-1.49.0/include
  boost-1.50           : -I/usr/local/boost-1.50.0/include
  boost-1.51           : -I/usr/local/boost-1.51.0/include
  boost-1.52           : -I/usr/local/boost-1.52.0/include
  boost-1.53           : -I/usr/local/boost-1.53.0/include
  boost-1.54           : -I/usr/local/boost-1.54.0/include
  boost-1.55           : -I/usr/local/boost-1.55.0/include
  boost-1.56           : -I/usr/local/boost-1.56.0/include
  boost-1.57           : -I/usr/local/boost-1.57.0/include
  boost-1.58           : -I/usr/local/boost-1.58.0/include
  c++11                : -std=c++11
  c++14                : -std=c++14
  c++1z                : -std=c++1z
  c++98                : -std=c++98
  cpp-pedantic         : -pedantic
  cpp-pedantic-errors  : -pedantic-errors
  cpp-verbose          : -v
  gnu++11              : -std=gnu++11
  gnu++14              : -std=gnu++14
  gnu++1z              : -std=gnu++1z
  gnu++98              : -std=gnu++98
  optimize             : -O2 -march=native
  sprout               : -I/usr/local/sprout
  warning              : -Wall -Wextra
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec wandbox` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/osyo-manga/gem-wandbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Release note

* 0.1.0
 * Release!!

