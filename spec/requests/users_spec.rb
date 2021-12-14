# frozen_string_literal: true

require 'rails_helper'
require 'json'

RSpec.describe 'Users API', js: true, type: :request do
  before(:all) do
    @user1 = User.create(username: 'mike1000')
  end

  describe 'POST /v1/signup' do
    context 'when a user signup with correct parameters' do
      before { post '/v1/signup', params: { username: 'johndoe' } }

      it 'it registers ok' do
        expect(JSON.parse(response.body)['username']).to eq('johndoe')
        expect(response).to have_http_status(201)
      end
    end

    context 'when a user signup with incorrect parameters' do
      before { post '/v1/signup', params: { username: 'john' } }

      it 'it doesn\'t register' do
        expect(JSON.parse(response.body)['errors']['username'][0]).to eq('is too short (minimum is 6 characters)')
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'POST /v1/signin' do
    context 'when a user signins with correct parameters' do
      before { post '/v1/signin', params: { username: 'mike1000' } }

      it 'it signins ok' do
        expect(JSON.parse(response.body)['username']).to eq('mike1000')
        expect(JSON.parse(response.body)['exp']).not_to be_nil
        expect(JSON.parse(response.body)['token']).not_to be_nil
        expect(response).to have_http_status(200)
      end
    end

    context 'when a user signins with incorrect parameters' do
      before { post '/v1/signin', params: { username: 'kevin300000' } }

      it 'it doesn\'t signin' do
        expect(JSON.parse(response.body)['error']).to eq('unauthorized')
        expect(response).to have_http_status(403)
      end
    end
  end
end
