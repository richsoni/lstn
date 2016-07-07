require 'spec_helper'
require './lib/frontend'
require 'pry'

RSpec.describe 'Frontend' do
  let(:mpd_data) {["Neil Young - Lookin' For A Love",
  "[playing] #12/17   0:45/3:16 (22%)",
  "volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")}

  let(:spotify_data) {[ "Current track:",
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

  let(:state) { Frontend.get_state }

  it 'gets formatted info from MPC Backend' do
    allow(MpcBackend).to(receive(:fetch_data)).and_return(mpd_data)
    expect(state[:artist]).to(eq("Neil Young"))
  end

  it 'gets formatted info from SpotifyBackend' do
    allow(MpcBackend).to(receive(:fetch_data)).and_return("")
    allow(SpotifyBackend).to(receive(:fetch_data)).and_return(spotify_data)
    expect(state[:artist]).to(eq("Gil Scott-Heron"))
  end
end