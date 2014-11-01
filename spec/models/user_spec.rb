require 'rails_helper'

RSpec.describe User, :type => :model do
  subject(:user) {User.new(email: 'email@email.com', password: 'password', password_confirmation: 'password')}

  # it 'should encrypt password' do
  #   user = User.create!(email: 'email', password: 'password', password_confirmation: 'password')
  #   user.encrypt_password()
  # end

  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should ensure_length_of(:email).is_at_most(50)}
  it {should validate_presence_of(:password)}
  it {should validate_confirmation_of(:password)}

end
