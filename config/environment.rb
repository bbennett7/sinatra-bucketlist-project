require 'pg'
require 'pry'

ENV['SINATRA_ENV'] ||= "bucketlistapp_development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "#{ENV['SINATRA_ENV']}"
)

require_all 'app'
