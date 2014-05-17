#!/usr/bin/env ruby

env = File.read('.env')
env.split("\n").map { |line| line.split("=") }.each { |v| ENV[v.first] = v.last }

require './lib/micro'

Project.update_data
