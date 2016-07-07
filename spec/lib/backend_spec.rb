require 'spec_helper'
require './lib/backend'
require 'pry'

RSpec.describe 'Backend' do
  it 'fails out silently' do
    result = Backend.parse({})
    expect(result[:artist]).to(eq(nil))
  end
end
