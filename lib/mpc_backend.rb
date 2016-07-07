require_relative 'backend'
class MpcBackend < Backend

  def artist
    line(0).split('-')[0].strip
  end

  def title
    line(0).split('-')[1].strip
  end

  def state
    line(1).match(/\[(.*)\]/)[1].to_sym
  end

  def self.fetch_data
    `mpc 2> /dev/null`
  end

end

