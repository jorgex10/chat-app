require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'GET index' do
    subject(:request) { get(:index, params:) }

    let!(:user) { create(:user, email: 'dummy@example.com') }
    let(:params) { {} }
    let(:parsed_response) { JSON.parse(response.body) }

    before { request }

    context 'with registered users' do
      it { expect(response).to have_http_status(:ok) }

      it { expect(parsed_response['users']).to match_array([JSON.parse(user.to_json)]) }
    end

    context 'with email param' do
      context 'when not matching' do
        let(:params) { { email: 'foo' } }

        it { expect(parsed_response['users']).to be_empty }
      end

      context 'when matching' do
        let(:params) { { email: 'dummy' } }

        it { expect(parsed_response['users']).to match_array([JSON.parse(user.to_json)]) }
      end
    end
  end

  describe 'POST create' do
    subject(:request) { post(:create, params:) }

    let(:params) { { user: { foo: '' } } }
    let(:parsed_response) { JSON.parse(response.body) }

    before { request }

    context 'without body params' do
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end

    context 'with body params' do
      context 'when using empty email or password' do
        let(:params) do
          {
            user: {
              email: '',
              password: ''
            }
          }
        end

        it { expect(response).to have_http_status(:unprocessable_entity) }
      end

      context 'when using correct email and password' do
        let(:email) { 'user@example.com' }
        let(:params) do
          {
            user: {
              email:,
              password: Faker::Internet.password
            }
          }
        end

        it { expect(parsed_response['user']['email']).to eq(email) }
      end
    end
  end
end
