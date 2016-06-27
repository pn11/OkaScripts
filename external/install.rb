#!/usr/bin/ruby
#encoding: utf-8

require 'json'

dirname = File.absolute_path(File.dirname($0))
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

    if !File.exists?("#{bindir}/#{proname}")
      `git clone #{reponame}`
      `ln -s #{dirname}/#{localdirname}/#{exename} #{bindir}/#{proname}`
      puts "Installed #{proname}"
    end
  }
}

## rename-exif
#git clone https://github.com/int128/rename-exif.git
#ln -snf $dir/rename-exif/rename-exif.rb ../bin/rename-exif
