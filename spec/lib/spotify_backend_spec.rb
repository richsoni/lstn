require 'spec_helper'
require_relative '../../lib/spotify_backend'
require 'pry'


RSpec.describe 'SpotifyBackend' do
  let(:spotify_data) {[ "Current track:",
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

  it 'parses spotify data' do
    result = SpotifyBackend.parse(spotify_data)
    expect(result[:artist]).to(eq("Gil Scott-Heron"))
    expect(result[:title]).to(eq("Whitey on the Moon"))
    expect(result[:state]).to(eq(:paused))
  end

end
