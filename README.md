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

# Why?
As a terminal user and microservice engineer, I jump back-and-forth between a lot of different projects.
I have a single directory that holds about 60 different git repos, and I like to be able to jump to any one of them from anywhere,
without having to set up a ton of aliases, or type out full names.

So, in my `~/.bashrc`, I might set up something like this:
```bash
export GIT_REPO_BASEDIR=/Users/kevin/Development

function nd
{
  local dir=$(nknm-dir -F $GIT_REPO_BASEDIR $1)
  if [ -n "$dir" ]
  then
    cd $dir
  else
    echo "No matching directory found" >&2
    return 1
  fi
}
export -f nd
```

Then, from my terminal prompt, I can be whisked away to the directory of my choosing:
```bash
-(git:main)-(16:57:28)-(~/Development/nknm/bin)-
$ nd dar
1) /Users/kevin/Development/darryl
2) /Users/kevin/Development/docker-library
? 1
-(git:features/overlaps2)-(16:57:44)-(~/Development/darryl)-
$
```

And when there's a single match for the nickname, no additional prompting is required.

# Problems?
Please submit an [issue](https://github.com/kevinstuffandthings/nknm/issues).
We'll figure out how to get you up and running with Nknm as smoothly as possible.
