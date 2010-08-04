#!/usr/bin/env ruby

require 'erb'
require 'todaysentry'
require 'episodeexists'

def html(d)
  # Bind vars for our erb template
  @updated = Time.now.xmlschema
  @todaysshow = File.read('entry.html')

  # Print erb template
  erb = ERB.new(File.read('html.erb'))
  erb.result(binding)
end

if __FILE__ == $0 then
  if(episode_exists(show_date(Date.today))) then
    puts html(Date.today)
  else
    exit 1
  end
end
