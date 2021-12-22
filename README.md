# Nknm ![Build Status](https://github.com/kevinstuffandthings/nknm/actions/workflows/ruby.yml/badge.svg) [![Gem Version](https://badge.fury.io/rb/nknm.svg)](https://badge.fury.io/rb/nknm)

Select from a list of items using easy-to-type nicknames.

## Installation
Add this line to your application's Gemfile:

```ruby
# update with the version of your choice
gem 'nknm'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install nknm
```

## Usage
Require the gem in your code:
```ruby
require "nknm"
```

You can use a static list of names:
```ruby
# source your names from a known list, or from a file, or anything...
options = Nknm::Lists::Names.new(%w[First Second Third Fourth Fifth])

nickname = Nknm::Nickname.new("fh")
options.matches_for(nickname).map(&:to_s)
# => ["Fourth", "Fifth"]

nickname = Nknm::Nickname.new("s")
options.matches_for(nickname).map(&:to_s)
# => ["Second"]
```

If you want to choose items from a directory, you can do that too:
```ruby
# try named params like `include_subdirs` or `include_files` (both default to true)
options = Nknm::Lists::Directory.new("/Users/kevin/Development")
```

#### Selectors
Using a terminal, and getting back multiple selections? Use a `Selector`:
```ruby
options = Nknm::Lists::Names.new(%w[First Second Third Fourth Fifth])
nickname = Nknm::Nickname.new("f")
matches = options.matches_for(nickname)

selection = Nknm::List::Selectors::Terminal.build(matches).selection
puts "You selected: #{selection}" if selection
```

You'll be prompted with:
```
1) First
2) Fourth
3) Fifth
?
```

Enter the number of your selection at the `?` prompt, and you'll have your match!

# Problems?
Please submit an [issue](https://github.com/kevinstuffandthings/nknm/issues).
We'll figure out how to get you up and running with Nknm as smoothly as possible.
