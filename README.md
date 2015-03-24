== README

This is a basic URL Shortener app. This app also exposes an API to create a URL Shortener.

* Ruby and Rails versions used are specified in the Gemfile

* To run the application
  * `bundle install` from project root directory
  * Uses PostgreSQL as a default DB.
  * `rake db:create` & `rake db:migrate`
  * `rails s` to kick start the application
  * The accepted valid URI corresponds to the regex provided by [standard URI library](http://ruby-doc.org/stdlib-2.2.1/libdoc/uri/rdoc/index.html)

* Tests
  * Specs for controllers(for the web app and the API), models and helpers have been added
  * Integration specs are present in `spec/requests`
  * One can run the entire test suite with the `rspec spec` command
