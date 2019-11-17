#!/usr/bin/env ruby

require "bundler/setup"
require "bestsellers"

Bestsellers::CLI.new.call
