require 'rspec'
require 'rails_helper'

RSpec.describe Client do
  subject(:client) { Client.new(name: "testclient", tel: "123", email: "me@home.com",
                                website: "www.bookme.com",
                                photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/promotions/test_image.jpg',
                                                                    'image/jpg')) }

  it { is_expected.to be_valid }
  it { should validate_presence_of :name }
  it { should validate_presence_of :tel }
  it { should validate_presence_of :email }
  it { should validate_presence_of :website }
  it { should validate_presence_of :photo }
  it { should validate_uniqueness_of :name }
  it { should ensure_length_of(:name).is_at_most(20) }
  it { should ensure_length_of(:email).is_at_most(50) }
  it { should ensure_length_of(:website).is_at_most(50) }
  it { should have_one(:address) }
  it { should accept_nested_attributes_for(:address) }

  it 'email should not be valid' do
    client.email=' '
    expect(client).to_not be_valid()
    client.email='@'
    expect(client).to_not be_valid()
    client.email=' '
    expect(client).to_not be_valid()
    client.email='.'
    expect(client).to_not be_valid()

  end
end