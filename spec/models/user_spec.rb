require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'should encrypt password' do
    user = User.create!(email: 'email', password: 'password', password_confirmation: 'password')
    user.encrypt_password()
  end
end
