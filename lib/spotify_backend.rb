require 'backend'
class SpotifyBackend < Backend

  def tail(line)
    line.split(":").last.strip
  end

  def artist
    tail(line(1))
  end

  def title
    tail(line(2))
  end

  def state
    tail(line(7)).to_sym
  end

  def self.fetch_data
    `spotify info`
  end
end

