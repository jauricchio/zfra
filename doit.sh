#!/bin/bash

./todaysentry.rb
./feed.rb > ze-frank-rides-again.atom.new && mv ze-frank-rides-again.atom{.new,}
./html.rb > index.html.new && mv index.html{.new,}
