require 'spec_helper'
require 'rails_helper'

describe Promotion do
  # it 'is invalid without promo type' do
  #   # subject.promo_type.should_not be_nil
  #   should_not be_valid
  # end
  #
  # it 'is invalid without start date' do
  #   # subject.start_date.should_not be_nil
  #   should_not be_valid
  # end
  # it 'is invalid without end date' do
  #   # subject.end_date.should_not be_nil
  #   should_not be_valid
  # end
  it 'should not have a start date in the past' do
    promotion = Promotion.new(start_date: '1-2-2001')
    promotion.should_not be_valid
    # promotion.errors[:start_date].should == 'start date cannot be in the past'


  end

  it 'should except start date in the future' do
    sd, ed = Date.today, Date.today
    sd += 1
    ed +=2
    promotion = Promotion.new({promo_type: '2-4-1', start_date: sd.strftime('%d-%m-%Y'), end_date: sd.strftime('%d-%m-%Y')})
    print promotion.errors[:start_date].size.should == 0

  end
end