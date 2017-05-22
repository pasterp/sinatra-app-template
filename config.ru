require "rubygems"
require "bundler/setup"


require_relative 'config/configuration'

# If you add a controller use 'use' keyword
use UtilsController
run IndexController