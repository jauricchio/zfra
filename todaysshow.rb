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
      raise
    end

    @title = "The Show for #{d.strftime('%A, %b %e')}"
    @summary = show_description(d)
    @link = show_url(d)
    @mdy = d.strftime('%m%d%y')
    @tag_ymd = today.strftime('%Y-%m-%d')

    @updated = Time.now.xmlschema

  end

  def to_atom
    erb = ERB.new(File.read('entry_atom.erb'))
    erb.result(binding)
  end

  def to_html
    erb = ERB.new(File.read('entry_html.erb'))
    erb.result(binding)
  end
end


if __FILE__ == $0 then
  show = Show.new(Date.today)
  puts show.to_atom
  puts show.to_html
end

