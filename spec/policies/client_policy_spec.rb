require 'rails_helper'

RSpec.describe ClientPolicy do

  subject { described_class }
  let (:client) {Client.create(publish: true)}

  context 'for a visitor' do
    permissions :new? do
      it 'denies access' do
        expect(subject).not_to permit(nil, :client)
      end
    end
    permissions :show? do
      it 'denies access if client is not published' do
          expect(subject).not_to permit(nil, Client.create(publish: false))
      end

      it 'allows access if client is published' do
        expect(subject).to permit(nil, Client.create(publish: true))
      end
    end
  end

  context 'for a logged in user' do
     permissions :new? do
       it 'allows access if user does not have client details' do
         expect(subject).to permit(User.create(client_id: nil), :client)
       end
     end

    permissions :new? do
      it 'denies access if user has client details' do
        expect(subject).not_to permit(User.create(client_id: 1), :client)
      end
    end

    permissions :show? do
      it 'allows if not published and user is owner' do
        expect(subject).to permit(User.create(client_id: 1), Client.create(id: 1, publish: false))
      end

      it 'denies if not published and user is not owner' do
        expect(subject).not_to permit(User.create(client_id: 2), Client.create(id: 1, publish: false))
      end

      it 'allows if not published, user is not owner, but user is admin' do
        expect(subject).to permit(User.create(role: 'admin'), Client.create(id: 1, publish: false))
      end
    end

     permissions :update? do
       it 'allows user with admin role' do
         expect(subject).to permit(User.create(role: 'admin'), Client.create(id: 1, publish: false))
       end

       it 'allows user who is a member of the client' do
         expect(subject).to permit(User.create(client_id: 1), Client.create(id: 1, publish: false))
       end

       it 'denies user who is a not member of the client' do
         expect(subject).not_to permit(User.create(client_id: 1), Client.create(id: 2, publish: false))
       end
     end
  end

end

