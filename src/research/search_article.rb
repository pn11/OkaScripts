#!/usr/bin/ruby
#encoding: utf-8

if ARGV.size == 3
  journal = ARGV[0]
  volume = ARGV[1]
  page = ARGV[2]
elsif ARGV.size == 2
  journal = ARGV[0]
  page = ARGV[1]
else
  puts "Number of Argument is wrong. Use like this:"
  puts "./search_article.rb prl 81 1562"
  exit
end

# ./program journal volume page

# Physical Review Letters
if /PRL/i =~ journal then
  volume = volume.to_i
  page = page.to_i
  page = "%06d" % page
  puts "Physical Review Letters, Volume #{volume}, pp. #{page} searched."
  puts
  url= "http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.#{volume}.#{page}"
  puts url
  `open \"#{url}\"`

  # Physical Review Letters D
elsif /PRD/i =~ journal then
  volume = volme.to_i
  page = page.to_i
  page = "%06d" % page
  puts "Physical Review Letters D, Volume #{volume}, pp. #{page} searched."
  puts ""
  url = "http://journals.aps.org/prd/abstract/10.1103/PhysRevD.#{volume}.#{page}"
  puts url
  `open \"#{url}\"`

  # Astrophysical Journal
elsif /APJ/i =~ journal then
  volume = volume.to_i
  page = page.to_i
  puts "Astrophysical Journal, Volume #{volume}, pp. #{page} searched."
  puts
  url = "http://iopscience.iop.org/findcontent?CF_JOURNAL=0004-637X&CF_VOLUME=#{volume}&CF_PAGE=#{page}&submit=Find+article&navsubmit=Find+article"
  puts url
  `open \"#{url}\"`

  # Progress of Theoretical and Experimental Physics
elsif /PTEP/i =~ journal then
#  page = "063C01" ## for example
  puts "Progress of Theoretical and Experimental Physics, #{page} searched."
  puts
  url = "http://ptep.oxfordjournals.org/search?submit=Search&firstpage=#{page}"
  puts url
  `open \"#{url}\"`

else
  puts "Jounal not found. Available journal is"
  puts "PRL: Physical Review Letters"
  puts "PRD: Physical Review Letters D"
  puts "Apj: Astrophysical Journal"
  puts "PTEP: Progress of Theoretical and Experimental Physics"
end
