#!/usr/bin/ruby

require 'net/http'
require 'uri'

require 'showdate'
require 'bettershowurl'

def episode_exists(date)

  # Convert date to show URL
  url = show_url(date)

  # Does Ze's server return 404 or 200 for this page?
  res = Net::HTTP.start('www.zefrank.com', 80) do |http|
    http.head(url)
  end
  return res.class == Net::HTTPOK
end


if __FILE__ == $0 then
  require 'date'
  puts "There is #{episode_exists(show_date Date.today) ?"":"not "}an episode today."
  puts "There was #{episode_exists(show_date Date.today-1) ?"":"not "}an episode yesterday."
end

