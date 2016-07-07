class Backend
  attr_accessor :fetch_data

  def initialize(fetch_data)
    @fetch_data = fetch_data
  end

  def lines
    @lines ||= fetch_data.split("\n")
  end

  def line(num)
    lines[num]
  end

  def parse
    {
      artist: artist,
      title:  title,
      state:  state,
    }
    rescue
      {
        artist: nil,
        title: nil,
        state: nil,
      }
  end

  def self.parse(data = nil)
    data ||= fetch_data
    parser = self.new(data)
    parser.parse
  end


  def self.fetch_and_parse
    parse(fetch_data)
  end



end
