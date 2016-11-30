#!/usr/bin/ruby
# coding: utf-8

require 'oauth'
require 'oauth/consumer'
require "evernote_oauth"
require "json"

def login2pocket(dirname)
  token_json = open("#{dirname}/token.json") do |io|
    JSON.load(io)
  end
  
  token_hash = Hash.new
  token_hash["consumer_key"] = token_json["consumer_key"]
  token_hash["access_token"] = token_json["access_token"]
  puts token_json["comment"]

  return token_hash
end
