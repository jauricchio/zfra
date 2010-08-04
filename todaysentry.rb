#!/usr/bin/env ruby

require 'todaysshow'
require 'episodeexists'

def todays_entry(d)

  # Read the log
  entries = IO.read('entries.log')

  # Get today's entry
  begin
    today = Show.new(d).to_atom
  rescue
    today = ""
  end

  # Write today's entry to the front of the log
  File.open('entries.log.new', 'w') do |f|
    f.write(today)
    f.write(entries)
  end

  # Move new log into place
  require 'fileutils'
  FileUtils.mv('entries.log.new', 'entries.log')

end

if __FILE__ == $0 then
  if(episode_exists(show_date(Date.today))) then
     todays_entry(Date.today)
  end
end
