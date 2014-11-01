require 'spec_helper'
require 'rails_helper'

# TODO rewrite to avoid clash with the shoulda permit method

RSpec.describe PromotionPolicy do
  let(:user_not_logged_in) { nil }
  let(:user_logged_in) { FactoryGirl.build_stubbed(:user) }
  let(:promotion) { mock_model(Promotion) }

  subject(:policy) { described_class }

  # context 'as a visitor' do
  #
  #   permissions ".scope" do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #   end
  #
  #   permissions :new?, :create?, :update?, :destroy? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, promotion)
  #     end
  #   end
  #
  #   permissions :show? do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #   end
  # end
  #
  # context 'as a logged in user' do
  #   permissions ".scope" do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #   end
  #
  #   permissions :new?, :create?, :index?, :show?, :update?, :destroy? do
  #     it 'should permit action' do
  #       expect(policy).to Pundit::RSpec::Matchers.permit(user_logged_in, promotion)
  #     end
  #   end
  # end
end
