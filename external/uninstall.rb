#!/usr/bin/ruby
#encoding: utf-8

require 'json'

if ARGV.size == 0
  puts "input program name you want to install."
  exit
end

dirname = File.absolute_path(File.dirname($0))
puts dirname
bindir = dirname + "/../bin"

Dir.chdir(dirname){
  
  json_data = open("list.json") do |io|
    JSON.load(io)
  end
  
  json_data.each{|key,value|
    proname = key
    exename = value["exename"]
    localdirname = value["dirname"]
    reponame =  value["reponame"]

    if proname == ARGV[0]
      `yes y | rm -r #{dirname}/#{localdirname}`
      `rm  #{bindir}/#{proname}`
      puts "Uninstalled #{proname}"
    end
  }
}

