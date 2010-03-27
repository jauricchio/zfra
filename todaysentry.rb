#!/usr/bin/env ruby

require 'todaysshow'

def todays_entry(d)

  # Read the log
  entries = IO.read('entries.log')

  # Get today's entry
  today = Show.new(d).to_atom

  # Write today's entry to the front of the log
  File.open('entries.log.new', 'w') do |f|
    f.write(today)
    f.write(entries)
  end

  # Move new log into place
  FileUtils.mv('entries.log.new', 'entries.log')

end

if __FILE__ == $0 then
  todays_entry(Date.today)
end
