#!/usr/bin/env ruby

require 'date'

def show_date(today)
  rerun_start = Date.parse("2010-03-19")
  series_start = Date.parse("2006-03-17")

  series_start + (today - rerun_start)
end

if __FILE__ == $0 then
  puts show_date(Date.today)
end

