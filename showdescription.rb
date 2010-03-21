#!/usr/bin/ruby

require 'rubygems'
require 'hpricot'
require 'open-uri'

require 'showurl'

def show_description(date)
  url = show_url(date)

  doc = Hpricot(open(url))

  (doc/"#thetags").inner_html.strip.gsub("&quot;","")
end

if __FILE__ == $0 then
  require 'showdate'
  puts show_description(show_date(Date.today+1))
end
