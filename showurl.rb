#!/usr/bin/ruby

require 'Date'

def show_url(date)
  year = date.strftime "%Y"
  mon = date.strftime "%m"
  mdy = date.strftime "%m%d%y"

  "http://www.zefrank.com/theshow/archives/#{year}/#{mon}/#{mdy}.html"
end


if __FILE__ == $0 then
  require 'showdate'
  puts show_url(show_date Date.today)
end
