# encoding: utf-8
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end

require 'surveygizmo'
require 'rspec'
require 'webmock/rspec'

def a_delete(path, endpoint='https://restapi.surveygizmo.com')
  a_request(:delete, endpoint + path)
end

def a_get(path, endpoint='https://restapi.surveygizmo.com')
  a_request(:get, endpoint + path)
end

def a_post(path, endpoint='https://restapi.surveygizmo.com')
  a_request(:post, endpoint + path)
end

def a_put(path, endpoint='https://restapi.surveygizmo.com')
  a_request(:put, endpoint + path)
end

def stub_delete(path, endpoint='https://restapi.surveygizmo.com')
  stub_request(:delete, endpoint + path)
end

def stub_get(path, endpoint='https://restapi.surveygizmo.com')
  stub_request(:get, endpoint + path)
end

def stub_post(path, endpoint='https://restapi.surveygizmo.com')
  stub_request(:post, endpoint + path)
end

def stub_put(path, endpoint='https://restapi.surveygizmo.com')
  stub_request(:put, endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
