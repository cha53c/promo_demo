require 'rspec'
require 'rails_helper'

RSpec.describe 'EndDateCannotBeBeforeStartDate' do

  subject (:validator) {EndDateCannotBeBeforeStartDate.new}
  subject (:promotion) {Promotion.new}

  it 'should raise and error if the end date is before the start date' do
    startdate = Date.today
    enddate = Date.yesterday
    promotion.starts=startdate.strftime('%d-%m-%Y')
    promotion.ends=enddate.strftime('%d-%m-%Y')
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(1)
    expect(promotion.errors[:ends][0]).to eq("date cannot be before the start")
  end

  it 'should not raise an error if the end date is after the start date' do
    startdate = Date.today
    enddate = Date.tomorrow
    promotion.starts=startdate.strftime('%d-%m-%Y')
    promotion.ends=enddate.strftime('%d-%m-%Y')
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(0)
  end

  it 'should not raise an error if the end date is the same as the start date' do
    startdate = Date.today
    enddate = Date.today
    promotion.starts=startdate.strftime('%d-%m-%Y')
    promotion.ends=enddate.strftime('%d-%m-%Y')
    validator.validate(promotion)
    expect(promotion.errors.count).to eq(0)
  end


end