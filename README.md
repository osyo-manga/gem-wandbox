# Wandbox

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/wandbox`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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
$ wandbox run test.cpp --options="boost-1.58"
4.2.1 Compatible Clang 3.7.0 (trunk 241983)
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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec wandbox` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/osyo-manga/gem-wandbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
