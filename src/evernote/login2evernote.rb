#!/usr/bin/ruby
# coding: utf-8

require 'oauth'
require 'oauth/consumer'
require "evernote_oauth"
require "json"

def login2evernote(dirname)
  token_json = open("#{dirname}/developper_token.json") do |io|
    JSON.load(io)
  end
  
  token_hash = Hash.new
  token_hash[:token] = token_json["token"]
  token_hash[:sandbox] = token_json["sandbox"]
  puts token_json["comment"]

  client = EvernoteOAuth::Client.new(token_hash)

  return client
end
