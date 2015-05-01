require 'simplecov'
SimpleCov.start
require './app'
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
include Rack::Test::Methods
