require 'spec_helper'
require 'rails_helper'

describe Promotion do
  subject(:valid_promotion) { Promotion.new(description: 'blah', promo_type: '2 for 1',
                                            :image => File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'),
                                            fri: '1', starts: Date.today.strftime('%d-%m-%Y'), ends: Date.today.strftime('%d-%m-%Y')) }

  it { is_expected.to be_valid }

  # it 'should only validate if start date present' do
  #   expect(valid_promotion).to be_valid
  # end

  context 'it is not valid' do

    it 'without description' do
      valid_promotion.description=nil
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:description][0]).to eq('can\'t be blank')
    end

    it 'without an image ' do
      valid_promotion.image=nil
      expect(valid_promotion).to_not be_valid
    end

    it 'without at least one active weekday' do
      valid_promotion.fri='0'
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:base][0]).to eq("There needs to be a least one active weekday")
    end

    it 'without promo_type' do
      valid_promotion.promo_type=nil
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(2)
      expect(valid_promotion.errors[:promo_type][0]).to eq('can\'t be blank')
    end

    it 'if promo_type is less than 3 character' do
      valid_promotion.promo_type='ab'
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:promo_type][0]).to eq('is too short (minimum is 3 characters)')
    end

    it 'if promo_type is more than 20 characters' do
      valid_promotion.promo_type= 'a' * 21
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:promo_type][0]).to eq('is too long (maximum is 20 characters)')
    end

    it 'if the starts date is in the past' do
      valid_promotion.starts=Date.yesterday.strftime('%d-%m-%Y')
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:starts][0]).to eq('date cannot be in the past')
    end

    it 'without a starts date' do
      valid_promotion.starts=nil
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:starts][0]).to eq('can\'t be blank')
    end

    it 'without an ends date' do
      valid_promotion.ends=nil
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:ends][0]).to eq('can\'t be blank')
    end

    it 'if the ends date is before the starts date' do
      valid_promotion.ends=Date.yesterday.strftime('%d-%m-%Y')
      expect(valid_promotion).to_not be_valid
      expect(valid_promotion.errors.count).to eq(1)
      expect(valid_promotion.errors[:ends][0]).to eq('date cannot be before the start')
    end
  end

end