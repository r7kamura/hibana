# Hibana

A small rack-based web application framework.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hibana'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hibana

## Usage

Inherit `Hibana::Application` and run this class as a Rack application.

The following is an example app using this gem at v0.1.0. See the source code for more information.

```ruby
require 'hibana'
require 'rack/static'

$LOAD_PATH.unshift('lib')
require 'my_app/controllers/list_articles'
require 'my_app/controllers/show_article'
require 'my_app/controllers/show_articles_feed'
require 'my_app/controllers/show_sitemap'
require 'my_app/controllers/show_top_page'

module MyApp
  class Application < ::Hibana::Application
    route do
      get '/', to: ::MyApp::Controllers::ShowTopPage
      get '/articles', to: ::MyApp::Controllers::ListArticles
      get '/articles/:article_id', to: ::MyApp::Controllers::ShowArticle
      get '/feed.xml', to: ::MyApp::Controllers::ShowArticlesFeed
      get '/sitemap.txt', to: ::MyApp::Controllers::ShowSitemap
    end

    middleware.use(
      ::Rack::Static,
      root: 'static',
      urls: %w[
        /css
        /favicon.ico
        /images
      ]
    )
  end
end

run MyApp::Application
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r7kamura/hibana.
