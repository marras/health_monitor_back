require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/health_monitor'
require_relative '../apps/web/application'

Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/health_monitor')

Hanami::Container.configure do
  mount Web::Application, at: '/'
end
