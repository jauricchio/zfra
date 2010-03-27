#!/usr/bin/env ruby

require 'erb'
require 'todaysentry'

def feed(d)
  # Update entries.log
  todays_entry(d)

  # Bind vars for our erb template
  sleep(1) # because NetNewsWire gets weird if the feed's updated is the same
           # as the entry's updated
  @updated = Time.now.xmlschema
  @entries = File.read('entries.log')

  # Print erb template
  erb = ERB.new(File.read('feed.erb'))
  erb.result(binding)
end

if __FILE__ == $0 then
  puts feed(Date.today+2)
end
