[![Build Status](https://travis-ci.org/mocchit/gitconfigio.png)](https://travis-ci.org/mocchit/gitconfigio)
# GitConfigIO

gitconfig Input/Output

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitconfigio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitconfigio

## Usage
```
require 'gitconfigio'
# load gitconfig
conf = GitConfigIO::load('~/.gitconfig')
# create value
color = {'diff' => 'auto' , 'ui' => 'auto'}
# safe merge value
conf['color'] = color.merge conf['color'] || {}
# dump file
GitConfigIO::dump('~/.gitconfig.bak',conf)
```


## Contributing

1. Fork it ( https://github.com/mocchit/gitconfigio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## LICENCE
GNU GPLv３
