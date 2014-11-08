require 'rails_helper'

RSpec.describe Address, :type => :model do

  it { should validate_presence_of(:line1) }
  it { should validate_presence_of(:country) }
  it { should belong_to(:client)}
end
