require 'rspec'
require 'rails_helper'

RSpec.describe StartDateCannotBeBeforeToday do

  subject(:validator) { StartDateCannotBeBeforeToday.new }
  subject(:promotion) { Promotion.new }

  it 'should raise and error if start date if before today' do
    yesterday = Date.yesterday
    promotion.starts=yesterday.strftime('%d-%m-%Y')
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(1)
    expect(promotion.errors[:starts][0]).to eq("date cannot be in the past")
  end

  it 'should not raise an error if the start date is today' do
    today = Date.today
    promotion.starts=today.strftime('%d-%m-%Y')
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(0)
  end
end