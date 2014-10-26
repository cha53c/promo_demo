require 'rspec'
require 'rails_helper'

RSpec.describe AtLeastOneActivePromotionDay do
  subject(:validator) { AtLeastOneActivePromotionDay.new }
  subject(:promotion) { Promotion.new }

  it 'raise error if no active weekday' do
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(1)
    expect(promotion.errors[:base][0]).to eq("There needs to be a least one active weekday")
  end

  it 'to not raise error at least one weekday is active' do
    promotion.mon=true
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(0)
  end
end