require 'spec_helper'
require 'rails_helper'

describe Promotion do
  subject(:valid_promotion) { Promotion.new(description: 'blah',
                                            :image => File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'),
                                            fri: '1') }

  it { is_expected.to be_valid }

  # it 'should only validate if start date present' do
  #   expect(valid_promotion).to be_valid
  # end

  context 'it is not valid' do

    it 'without description' do
      valid_promotion.description=nil
      expect(valid_promotion).to_not be_valid
    end

    it 'without at least one active weekday' do
      valid_promotion.fri='0'
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:base][0]).to eq("There needs to be a least one active weekday")
    end

  end


  it 'should not have a start date in the past' do
    promotion = Promotion.new(promo_type: '2-4-1', start_date: '1-2-2001')
    # TODO need to change the way this is tested as it passes when other validations fail
    promotion.should_not be_valid
  end

  it 'should except start date in the future' do
    sd, ed = Date.today, Date.today
    sd += 1
    ed += 2
    promotion = Promotion.new({promo_type: '2-4-1', start_date: sd.strftime('%d-%m-%Y'), end_date: sd.strftime('%d-%m-%Y')})
  end
end