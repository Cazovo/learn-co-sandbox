#/usr/bin/env ruby

require 'pry'
require 'HTTParty'
require 'JSON'
require 'nokogiri'
require 'active_support/core_ext/hash'


require_relative "../lib/cli"
require_relative "../lib/api"
require_relative "../lib/anime"

CLI.new.menu