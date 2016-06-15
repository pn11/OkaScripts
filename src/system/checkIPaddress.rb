#!/usr/bin/ruby
# coding: utf-8

computerName = ""
dir = ""
ipaddress = ""

uname = `uname -s`.chomp

if uname == "Darwin"
  dir = "/Users/" + `whoami`.chomp.encode("utf-8") + "/Dropbox/status"
  computerName = `scutil --get ComputerName`.chomp # `uname -n` puts node name

  if computerName.encoding != "utf-8"
    computerName.encode!("utf-8", :invalid=>:replace)
  end

  computerName.gsub!(" ", "") # NO SPACE
  computerName.gsub!("\uFFFD", "") # NO REPLACED SYMBOLXS

  ipaddress = `ifconfig en0 | grep inet | grep -v inet6 | awk \'{print \$2}\'`.chomp
  
end

foutname = "#{dir}/ip_#{computerName}.txt"


fout = File.open(foutname, "w")
fout.puts ipaddress
fout.close

puts "ipaddress was #{ipaddress}. Saved in #{foutname}."
