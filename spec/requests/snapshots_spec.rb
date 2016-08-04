require 'rails_helper'

RSpec.describe "Snapshots", type: :request do
  context 'POST /snapshots' do
    context 'with json format' do
      let(:headers) do
        { 'Content-Type': 'application/json',
          'Accept': 'application/json' }
      end

      let(:params) { { snapshot: snapshot_params } }
      let(:snapshot_params) { FactoryGirl.attributes_for(:snapshot) }
      let(:json_params) { params.to_json }

      let(:perform_request) { post '/snapshots', json_params, headers }

      context 'with valid data' do
        it 'responds with correct status code' do
          perform_request
          expect(response).to have_http_status(:created)
        end

        it 'creates the record in the database' do
          expect { perform_request }.to change { Snapshot.count }.by 1
        end
      end

      context 'with invalid data' do
        let(:snapshot_params) { { foo: 'bar' } }

        it 'returns an error status code' do
          perform_request
          expect(response).to have_http_status :unprocessable_entity
        end

        it 'returns a JSON response with error messages' do
          perform_request
          expect(JSON.parse(response.body)).to have_key('errors')
        end
      end
    end
  end
end
