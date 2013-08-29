# Kuby

[![Build Status](https://travis-ci.org/rrooding/kuby.png?branch=master)](https://travis-ci.org/rrooding/kuby)

### Crash your Kerbals using Ruby!

Kuby is a Ruby wrapper for the game [Kerbal Space Program](https://kerbalspaceprogram.com/). This gem exposes a simple DSL with which you can control your rockets.

## Installation

Install the gem:

    $ gem install kuby
    
Make sure you have a recent version of KSP and also install the [Telemachus plugin](http://kerbalspaceport.com/telemachus/).

## Usage

### Basic example

Create a ruby file with the following contents (simple_launch.rb for example):

	require 'rubygems'
	require 'kuby'
	
	# Optional parameters :host, :port, otherwise defaults will be used (127.0.0.1:8085)
	link = Kuby::Link.new
	
	# Connect to KSP
	link.connect!
	
	# Initiate first stage
	link.stage!
	
	# Set to full throttle
	link.throttle_full
	
	# Activate SAS
	link.toggle_sas
	
Now create a new rocket in KSP or load an existing one. Be sure to add one of the Telemachus antennas to it, otherwise your rocket won't be able to communicate. Now go to the launchpad and when the ship is loaded and you are ready for launch, execute the following command in a terminal:

	$ ruby simple_launch.rb
	
Kuby will connect to your rocket and issue the commands in the order you specified in the file, your rocket will activate the first stage, go to full throttle and enable SAS. After that, the script ends but your rocket will keep flying.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
