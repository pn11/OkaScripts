#!/usr/bin/ruby
# coding: utf-8
require 'oauth'
require 'oauth/consumer'
require "evernote_oauth"
require "json"

dirname = File.absolute_path(File.dirname(File.dirname($0)+"/"+File.readlink($0)))
require "#{dirname}/login2evernote.rb"

client = login2evernote(dirname)

note_store = client.note_store
notebooks = note_store.listNotebooks()

notebooks.each do |notebook|
 puts "Notebook: #{notebook.name}" 
end
