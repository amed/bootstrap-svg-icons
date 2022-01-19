#!/usr/bin/env ruby

require 'uri'
require 'net/http'
require 'open-uri'
require 'json'


puts "updating bootstrap icons from github repository.....\n"

uri = URI('https://api.github.com/repos/twbs/icons/git/trees/4b040d10a7c33de9e348c89cf5a7ab2ae0a272b9')

response = Net::HTTP.get_response(uri)

if !response.is_a?(Net::HTTPSuccess)
  puts "api connect issue"
  puts "#{response.body}"
  return
end

icons_json = JSON[response.body]

icons_json["tree"].each do |icon|
  download_url = "https://raw.githubusercontent.com/twbs/icons/main/icons/#{icon["path"]}"
  file_name = "lib/bootstrap/svg/icons/svg-files/#{icon["path"]}"
  puts "saving #{icon["path"]}"

  # prevent duplication (DEBUG) it blocks update to lastest
  next if File.file?(file_name)

  open(file_name, 'wb') do |file|
    file << URI.open(download_url).read
  end
end

puts "\ndone!"
