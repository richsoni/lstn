require 'spec_helper'
require_relative '../../lib/mpc_backend'
require 'pry'

RSpec.describe 'MpcBackend' do
  let(:mpd_data){["Neil Young - Lookin' For A Love",
  "[playing] #12/17   0:45/3:16 (22%)",
  "volume: 96%   repeat: on    random: on    single: off   consume: off"].join("\n")}

  it 'parses mpc data' do
    result = MpcBackend.parse(mpd_data)
    expect(result[:artist]).to(eq("Neil Young"))
    expect(result[:title]).to(eq("Lookin' For A Love"))
    expect(result[:state]).to(eq(:playing))
  end
end
