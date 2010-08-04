#!/usr/bin/ruby

require 'date'
require 'showdate'

def show_url(wanted_date)
  urls = File.readlines('show_urls.txt').map {|line|
    (d, u) = line.split(' ',2)
    date = Date.parse(d)
    url = u.chomp
    [date, url]
  }

  (urls.find {|i| i[0].eql? wanted_date })[1]
end


if __FILE__ == $0 then
  require 'showdate'
  puts show_url(show_date Date.today)
end
