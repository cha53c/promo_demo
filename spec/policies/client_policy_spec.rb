require 'rails_helper'

# TODO rewrite to avoid clash with the shoulda permit method

RSpec.describe ClientPolicy do

  subject { described_class }
  let (:client) {Client.create(publish: true)}

  # let(:user_not_logged_in) { nil }
  # let(:user_logged_in) { FactoryGirl.build_stubbed(:user) }
  # let(:client) { mock_model(Client) }



  context 'for a visitor' do
    let(:user) {nil}
    permissions :show? do
      it 'denies access if client is not published' do
          expect(subject).not_to permit(nil, Client.create(publish: false))
      end

      it 'allows access if client is published' do
        expect(subject).to permit(nil, Client.create(publish: true))
      end
    end
  end

  # context 'for a visitor' do
  #   # permissions ".scope" do
  #   #   pending "add some examples to (or delete) #{__FILE__}"
  #   # end
  #   permissions :new? do
  #     it 'should not permit_it action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  #   permissions :create? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  #   permissions :show? do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #     # it 'should permit action' do
  #     #   expect(policy).to permit_it(user_not_logged_in, client)
  #     # end
  #   end
  #
  #   permissions :show? do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #     # it 'should permit action' do
  #     #   expect(policy).to permit_it(user_not_logged_in, client)
  #     # end
  #   end
  #
  #   permissions :update? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  #   permissions :destroy? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  # end
  #
  # context 'for a logged in user' do
  #   # permissions ".scope" do
  #   #   pending "add some examples to (or delete) #{__FILE__}"
  #   # end
  #
  #   permissions :index? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :new? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :create? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :show? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :update? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :destroy? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  # end
end
