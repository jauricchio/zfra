#!/usr/bin/env ruby

require 'erb'
require 'episodeexists'
require 'showdate'
require 'showdescription'
require 'bettershowurl'

class Show
  def initialize(today)
    d = show_date(today)

    if(!episode_exists(d)) then
      exit
    end

    @title = "The Show for #{d.strftime('%A, %b %e')}"
    @summary = show_description(d)
    @link = show_url(d)
    @mdy = d.strftime('%m%d%y')
    @tag_ymd = today.strftime('%Y-%m-%d')

    @updated = Time.now.xmlschema

  end

  def to_atom
    erb = ERB.new(File.read('entry.erb'))
    erb.result(binding)
  end
end


if __FILE__ == $0 then
  show = Show.new(Date.today)
  puts show.to_atom
end

