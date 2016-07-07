require 'spec_helper'
require 'pry'

COMMAND="PIPING=y ./lstn"

RSpec.describe 'Lstn' do
  describe 'mpc' do
    let(:paused){["Neil Young - Lookin' For A Love",
    "[paused] #12/17   0:45/3:16 (22%)",
    "volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")}

    let(:playing){["Neil Young - Lookin' For A Love",
    "[playing] #12/17   0:45/3:16 (22%)",
    "volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")}

    let(:off){"mpd error: Connection refused"}

    it 'takes command line echos' do
      output = `echo "#{playing}" | #{COMMAND}`
      expect(output).to(eq("Neil Young - Lookin' For A Love\n"))
    end

    it 'does not print for paused' do
      output = `echo "#{paused} | #{COMMAND}`
      expect(output).to(eq(""))
    end

    it 'does not print if mpd is off' do
      output = `echo "#{off} | #{COMMAND}`
      expect(output).to(eq(""))
    end
  end

  describe 'Basic App' do
    let(:playing) {[
      "Rich Soni - Fly Away",
      "[playing]",
    ].join("\n")}

    it 'takes command line echos' do
      output = `echo "#{playing}" | #{COMMAND}`
      expect(output).to(eq("Rich Soni - Fly Away\n"))
    end
  end

end
