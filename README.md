## Absolution ##

Want to know if a string is an absolute URL? Heck, want to construct an
absolute URL from a base URL and a path? This is your lucky day!

There's not much to this thing, and what's there exists only to serve the
needs that I've had for this sort of thing.

That said, pull requests are totally welcome :)

## Gem Setup ##

```ruby
gem install absolution

# Gemfile
gem 'absolution'
```
## Basic usage (class methods) ##

```ruby
require 'absolution'

Absolution.absolute_url?('blah')
  => false
Absolution.absolute_url?('/blah')
  => false
Absolution.absolute_url?('http://blah')
  => true

Absolution.construct_absolute_url('https://base.url', 'blah')
  => 'https://base.url/blah'
```

## Other usage (mixin) ##

Want a class to know how to do this stuff on its own?

```ruby
require 'absolution'

class SomeClass
  include Absolution

  def absolute_url_to(somefile)
    return somefile if absolute_url?(somefile)
    construct_absolute_url('http://base.url', somefile)
  end
end
```

## Contributing ##

Do you use git-flow? I sure do. Please base anything you do off of
[the develop branch](https://github.com/ess/factis/tree/develop).

1. Fork it.
2. Perform some BDD magic. Seriously. Be testing.
3. Submit a pull request.

## History ##

* 0.0.2 - Initial release

## License ##

MIT License. Copyright 2014 Dennis Walters
