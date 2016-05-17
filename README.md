== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.2.5



* System dependencies


config/initializers/secret_token.rb
config/secrets.yml


gem 'rails', '4.2.2'
gem 'bcrypt',                  '3.1.7'
gem 'faker',                   '1.4.2'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.36.0'
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass',          '3.2.0.0'
gem 'sass-rails',              '5.0.2'
gem 'uglifier',                '2.5.3'
gem 'coffee-rails',            '4.1.0'
gem 'jquery-rails',            '4.0.3'
gem 'turbolinks',              '2.3.0'
gem 'jbuilder',                '2.2.3'
gem 'sdoc',                    '0.4.0', group: :doc
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'

  gem 'sqlite3',     '1.3.9'
   gem 'byebug',      '3.4.0'
   gem 'web-console', '2.0.0.beta3'
   gem 'spring',      '1.1.3'

end
group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace', '0.1.3'
  gem 'guard-minitest', '2.3.1'
end

group :production do
  gem 'pg', '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'puma', '3.1.0'
end





* Configuration

root 'static_pages#home'

get 'static_pages/home'

get 'static_pages/help'

get 'static_pages/about'

def home
end

def help
end

def about
end

Custom Helpers:

def full_title(page_title = '')
  base_title = "Ruby on Rails Thrive App"
  if page_title.empty?
    base_title
  else
    page_title + " | " + base_title
  end
  end

* Database creation

* Database initialization

* How to run the test suite

command-line commande: bundle exec rake test


ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
Setup all fixtures in test/fixtures/.yml for all tests in alphabetical order.
  fixtures :all
Add more helper methods to be used by all tests here...
end


require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Thrive App"
    # assert_select method allows me to teset for the presence of a particular HTML tag assert_select (selector)
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Thrive App"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Ruby on Rails Thrive App"
  end
end


CLI: rails generate integration_test site_layout ;

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count:2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end




* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* MISC ...
git add .
git commit -m ""
git checkout
git merge static_pages
git push
bundle exec rake
rails s
rake routes


def string_shuffle(s = "foobar")
s.split('').shuffle.join.upcase!
end
string_shuffle("foobar")
 => "oobfra"

Solved this error:

 ERROR["test_should_get_new", UsersControllerTest, 2016-05-16 12:37:44 -0600]
  test_should_get_new#UsersControllerTest (1463423864.00s)
 ActiveRecord::RecordNotUnique:         ActiveRecord::RecordNotUnique: SQLite3::ConstraintException: UNIQUE constraint failed: users.email: INSERT INTO "users" ("name", "email", "created_at", "updated_at", "id") VALUES ('MyString', 'MyString', '2016-05-17 19:13:13', '2016-05-17 19:13:13', 298486374)

 by deleting contents in the fixtures >> users.yml. This was deleted before starting passwords and real close to finishing email uniqueness. 











Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
