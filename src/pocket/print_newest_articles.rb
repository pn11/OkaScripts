#!/usr/bin/ruby
# coding: utf-8
require 'net/http'
require 'uri'
require 'json'

if File.symlink?($0)
	dirname = File.absolute_path(File.dirname(File.dirname($0)+"/"+File.readlink($0)))
else
	dirname = File.absolute_path(File.dirname($0))
end

require "#{dirname}/login2pocket.rb"

count = 10 # number of artcle to be retrieved

url_get = 'https://getpocket.com/v3/get'
#https://getpocket.com/developer/docs/v3/retrieve


hash_login = login2pocket(dirname)

response = Net::HTTP.post_form(URI.parse(url_get),
                          {'consumer_key'=>hash_login["consumer_key"], 'access_token'=>hash_login["access_token"],
                          'count'=>count})

hash_response = JSON.load(response.body)
hash_list = hash_response["list"]

i = 1
hash_list.each do |k, v|
	hash_item = v
    title_string = hash_item["resolved_title"]
    url_string =  hash_item["resolved_url"]
	puts "No. #{i} #{title_string}"
	i += 1
end
