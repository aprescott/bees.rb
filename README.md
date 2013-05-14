# 500 The Bees They're In My Eyes

Replace the 500 HTTP status message with [`The Bees They're In My Eyes`](https://github.com/codahale/codahale.com/blob/036912e018da23cabd19f1062a0915b2f9a8d114/_posts/2010-10-07-you-cant-sacrifice-partition-tolerance.md#on-availability) in all your favourite web servers:

* Rack
* Puma
* Thin
* Webrick
* CGI

## Install

Installation is via RubyGems:

```bash
$ gem install bees
```

## Build the hive

```ruby
require "rack/bees"
Rack::Handler::Thin.run lambda { |env| [500, { "Content-Type" => "text/html" }, ["Hello world!"]] }, :Port => 5909
```

## Shake the hive

```
$ curl -sI localhost:5909 | head -n 1
HTTP/1.1 500 The Bees They're In My Eyes
```

## Hives

```ruby
# rack bees (also covers Puma and others that rely on Rack's status info)
require "rack/bees"

# thin bees
require "thin/bees"

# webrick bees
require "webrick/bees"

# cgi bees
require "cgi/bees"

# any of the above that'll successfully load
require "bees"
# Failed to require rack/bees -- skipping
# Failed to require thin/bees -- skipping
# Failed to require cgi/bees -- skipping

WEBrick::HTTPStatus::StatusMessage[500]
#=> "The Bees They're In My Eyes"
```

# My server needs bees too!

Want bees in your favourite web server? [Open an issue or a pull request](https://github.com/aprescott/bees.rb)!

# License

Copyright Adam Prescott. Released under the MIT license. Any contributions will be assumed by default to be under the same terms.
