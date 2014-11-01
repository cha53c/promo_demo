require 'rspec'
require 'rails_helper'

RSpec.describe Cuisine do

  it {should ensure_length_of(:cuisine).is_at_most(15)}
end