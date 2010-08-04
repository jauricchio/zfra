#!/bin/bash

./todaysentry.rb
./feed.rb > ze-frank-rides-again.atom.new && mv ze-frank-rides-again.atom{.new,}
