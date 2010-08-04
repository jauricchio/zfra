#!/usr/bin/env ruby

require 'erb'
require 'todaysentry'
require 'episodeexists'

def feed(d)

  sleep(1) # because NetNewsWire gets weird if the feed's updated is the same
           # as the entry's updated; the entry was probably just updated

  # Bind vars for our erb template
  @updated = Time.now.xmlschema
  @entries = File.read('entries.log')

  # Print erb template
  erb = ERB.new(File.read('feed.erb'))
  erb.result(binding)
end

if __FILE__ == $0 then
  if(episode_exists(show_date(Date.today))) then
    puts feed(Date.today)
  else
    exit 1
  end
end
