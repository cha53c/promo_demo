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
  it 'should only validate if start date present' do
    promotion = Promotion.new(description: 'blah', :image => File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'))
    promotion.should be_valid
  end

  it 'should fail if description is not present' do
    promotion = Promotion.new(:image => File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'))
    promotion.should_not be_valid
  end

  it 'should not have a start date in the past' do
    promotion = Promotion.new(promo_type: '2-4-1', start_date: '1-2-2001')
    # TODO need to change the way this is tested as it passes when other validations fail
    promotion.should_not be_valid
  end

  it 'should except start date in the future' do
    sd, ed = Date.today, Date.today
    sd += 1
    ed +=2
    promotion = Promotion.new({promo_type: '2-4-1', start_date: sd.strftime('%d-%m-%Y'), end_date: sd.strftime('%d-%m-%Y')})

  end
end