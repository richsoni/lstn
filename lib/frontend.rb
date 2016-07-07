require_relative 'mpc_backend'
require_relative 'spotify_backend'

class Frontend
  def mpc
    MpcBackend.fetch_and_parse
  end

  def spotify
    SpotifyBackend.fetch_and_parse
  end

  def backend
    return mpc if mpc[:state] == :playing
    return spotify if spotify[:state] == :playing
    return {}
  end

  def get_state
    return {
      :artist => backend[:artist]
    }
  end

  def self.get_state
    self.new.get_state
  end

  def print
    return "" unless backend[:state]
    "#{backend[:artist]} - #{backend[:title]}"
  end

  def self.print
    self.new.print
  end
end
