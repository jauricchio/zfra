#!/usr/bin/env ruby

require 'fileutils'

require 'todaysshow'
require 'episodeexists'

def todays_entry(d)

  # Get today's entry
  begin
    s = Show.new(d)
    today_atom = s.to_atom
    today_html = s.to_html
  rescue
    today = ""
  end

  # Write today's entry to the front of the log
  entries = IO.read('entries.log')

  File.open('entries.log.new', 'w') do |f|
    f.write(today_atom)
    f.write(entries)
  end

  # Move new log into place
  FileUtils.mv('entries.log.new', 'entries.log')

  # Write today's html chunk
  File.open('entry.html.new', 'w') do |f|
    f.write(today_html)
  end

  # Move new chunk into place
  FileUtils.mv('entry.html.new', 'entry.html')

end

if __FILE__ == $0 then
  if(episode_exists(show_date(Date.today))) then
     todays_entry(Date.today)
  end
end
