#!/usr/bin/env ruby

require 'date'

$rerun_start = Date.parse("2010-03-19")
$series_start = Date.parse("2006-03-17")

def show_date(today)
    $series_start + (today - $rerun_start)
end

if __FILE__ == $0 then
  puts show_date(Date.today)
end

