require 'spec_helper'
require 'pry'

MPD_DATA = ["Neil Young - Lookin' For A Love",
"[playing] #12/17   0:45/3:16 (22%)",
"volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")

class MpcParser
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

  def artist
    line(0).split('-')[0].strip
  end

  def title
    line(0).split('-')[1].strip
  end

  def state
    line(1).match(/\[(.*)\]/)[1].to_sym
  end

  def parse
    {
      artist: artist,
      title:  title,
      state:  state,
    }
  end

  def self.parse(fetch_data)
    parser = self.new(fetch_data)
    parser.parse
  end

end

RSpec.describe 'MpcParser' do
  it 'parses mpc data' do
    result = MpcParser.parse(MPD_DATA)
    expect(result[:artist]).to(eq("Neil Young"))
    expect(result[:title]).to(eq("Lookin' For A Love"))
    expect(result[:state]).to(eq(:playing))
  end

end
