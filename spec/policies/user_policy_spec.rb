require 'rspec'
require 'spec_helper'
require 'rails_helper'


RSpec.describe UserPolicy do
  subject{ described_class }
  let(:user_class) { FactoryGirl.build_stubbed(:user) }

  context 'for a logged in user' do
    permissions :index? do
      it 'allows access to admin' do
        expect(subject).to permit(User.new(role: 'admin'))
      end

      it 'denies access to non admin' do
        expect(subject).not_to permit(User.new(role: 'client'))
      end
    end

    permissions :destroy? do
      it 'allows access to admin' do
        expect(subject).to permit(User.new(role: 'admin'))
      end
      it 'denies access to non admin' do
        expect(subject).not_to permit(User.new(role: 'client'))
      end
    end

    permissions :show? do

      it 'allows access to its own user' do
        expect(subject).to permit(User.new(id: 1, role: 'client'),User.new(id: 1, role: 'client') )
      end

      it 'allows access to admin' do
        expect(subject).to permit(User.new(role: 'admin'))
      end

      it 'denies access to non admin who is not the user' do
        expect(subject).not_to permit(User.new(id: 1, role: 'client'),User.new(id: 2, role: 'client') )
      end
    end
  end
end