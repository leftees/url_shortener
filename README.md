== README

This is a basic URL Shortener app. This app also exposes an API to create a URL Shortener.

* Ruby and Rails versions used are specified in the Gemfile

* To run the application
  * `bundle install` from project root directory
  * Uses PostgreSQL as a default DB.
  * `rake db:create` & `rake db:migrate`
  * `rails s` to kick start the application
  * The accepted valid URI corresponds to the regex provided by [standard URI library](http://ruby-doc.org/stdlib-2.2.1/libdoc/uri/rdoc/index.html)
  * Also please note, I've used a custom domain name(my-awesome-urlshortner.com) instead of `localhost`. I've added it in the [helper](https://github.com/boddhisattva/url_shortener/blob/dev/app/helpers/links_helper.rb)(would want to move this to as ENV variable - a todo for me). One can add their own domain name by specifying the needful in the `\etc\hosts`. Please also note that the name one would specify in `\etc\hosts` wouldn't include the port number. I've added 3000 as the port number in the helper assuming your app is running on that port number

* Tests
  * Specs for controllers(for the web app and the API), models and helpers have been added
  * Integration specs are present in `spec/requests`
  * One can run the entire test suite with the `rspec spec` command
