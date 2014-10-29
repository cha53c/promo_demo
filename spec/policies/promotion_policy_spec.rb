require 'spec_helper'
require 'rails_helper'

RSpec.describe PromotionPolicy do

  let(:user_not_logged_in) { nil }
  let(:user_logged_in) { FactoryGirl.build_stubbed(:user) }
  let(:promotion) { mock_model(Promotion) }

  subject(:policy) { described_class }

  context 'as a visitor' do

    permissions ".scope" do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    permissions :new? do
      it 'should not permit action' do
        expect(policy).not_to permit_it(user_not_logged_in, promotion)
      end
    end

    permissions :create? do
      it 'should not permit action' do
        expect(policy).not_to permit_it(user_not_logged_in, promotion)
      end
    end

    permissions :show? do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    permissions :show? do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    permissions :update? do
      it 'should not permit action' do
        expect(policy).not_to permit_it(user_not_logged_in, promotion)
      end
    end

    permissions :destroy? do
      it 'should not permit action' do
        expect(policy).not_to permit_it(user_not_logged_in, promotion)
      end
    end
  end

  context 'as a logged in user' do
    permissions ".scope" do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    permissions :new? do
      it 'should permit action' do
        expect(policy).to permit_it(user_logged_in, promotion)
      end
    end

    permissions :create? do
      it 'should permit action' do
        expect(policy).to permit_it(user_logged_in, promotion)
      end
    end

    permissions :index? do
      it 'should permit action' do
        expect(policy).to permit_it(user_logged_in, promotion)
      end
    end

    permissions :show? do
      it 'should permit action' do
        expect(policy).to permit_it(user_logged_in, promotion)
      end
    end

    permissions :update? do
      it 'should permit action' do
        expect(policy).to permit_it(user_logged_in, promotion)
      end
    end

    permissions :destroy? do
      it 'should permit action' do
        expect(policy).to permit_it(user_logged_in, promotion)
      end
    end
  end
end
