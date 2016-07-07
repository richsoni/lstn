require 'spec_helper'
require 'pry'

RSpec.describe 'Music' do
  describe 'mpc' do
    let(:paused){["Neil Young - Lookin' For A Love",
    "[paused] #12/17   0:45/3:16 (22%)",
    "volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")}

    let(:playing){["Neil Young - Lookin' For A Love",
    "[playing] #12/17   0:45/3:16 (22%)",
    "volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")}

    let(:off){"mpd error: Connection refused"}

    it 'takes command line echos' do
      output = `echo "#{playing}" | PIPING=y ./music`
      expect(output).to(eq("Neil Young - Lookin' For A Love\n"))
    end

    it 'does not print for paused' do
      output = `echo "#{paused} | PIPING=y ./music`
      expect(output).to(eq(""))
    end

    it 'does not print if mpd is off' do
      output = `echo "#{off} | PIPING=y ./music`
      expect(output).to(eq(""))
    end
  end

  describe 'spotify' do
    let(:paused) {[ "Current track:",
      "Artist:   Gil Scott-Heron",
      "Track:    Whitey on the Moon",
      "Album:    The Revolution Begins: The Flying Dutchman Masters",
      "URI:      spotify:track:2355UaWJqfhsnstzsLT49h",
      "Duration: 1min 59s (119 seconds)",
      "Now at:   1min 37s",
      "Player:   paused",
      "Volume:   87",
      "Repeat is on.",
    ].join("\n")}

    let(:playing) {[ "Current track:",
      "Artist:   Gil Scott-Heron",
      "Track:    Whitey on the Moon",
      "Album:    The Revolution Begins: The Flying Dutchman Masters",
      "URI:      spotify:track:2355UaWJqfhsnstzsLT49h",
      "Duration: 1min 59s (119 seconds)",
      "Now at:   1min 37s",
      "Player:   playing",
      "Volume:   87",
      "Repeat is on.",
    ].join("\n")}

    it 'takes command line echos' do
      output = `echo "#{playing}" | PIPING=y ./music`
      expect(output).to(eq("Gil Scott-Heron - Whitey on the Moon\n"))
    end

    it 'does not print for paused' do
      output = `echo "#{paused} | PIPING=y ./music`
      expect(output).to(eq(""))
    end
  end

end
