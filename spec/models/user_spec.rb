require 'rails_helper'

RSpec.describe User, :type => :model do
  subject(:user) {User.new(email: 'email@email.com', role: 'client', password: 'password', password_confirmation: 'password')}

  # it 'should encrypt password' do
  #   user = User.create!(email: 'email', password: 'password', password_confirmation: 'password')
  #   user.encrypt_password()
  # end

  it 'should have 3 roles defined' do
    expect(User::ROLES.size).to eq(3)
  end

  it {should validate_presence_of(:role)}
  it {should validate_inclusion_of(:role).in_array(%w(admin client acc_manager))}
  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should ensure_length_of(:email).is_at_most(50)}
  it {should validate_presence_of(:password)}
  it {should validate_confirmation_of(:password)}

end
