require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV["postgres://tlhkqmpbkfjcnx:JulEoSjsAlhM4aT7zdzeG_KrZt@ec2-54-197-230-210.compute-1.amazonaws.com:5432/d9k14ruspf6lei"] || "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!