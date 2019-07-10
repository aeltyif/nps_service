require 'rails_helper'

RSpec.describe Api::V1::NetPromoterScoresController, type: :controller do
  let(:seller)             { create(:seller, name: 'Hello Realtor') }
  let(:realtor)            { create(:realtor, name: 'Hello Respondent') }
  let(:net_promoter_score) { create(:net_promoter_score, respondent: seller, object: realtor) }
  let(:valid_attributes)   { FactoryBot.attributes_for(:net_promoter_score, respondent_type: 'Seller', respondent_id: seller.id, object_type: 'Realtor', object_id: realtor.id) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:net_promoter_score, :invalid) }

  describe 'GET #index' do
    before(:each) do
      net_promoter_score
    end
    it 'returns error message for missing the touchpoint' do
      get :index, params: {}
      response_body = JSON.parse(response.body)
      expect(response).to                have_http_status(:unprocessable_entity)
      expect(response_body['errors']).to eq('Touchpoint is required to proceed')
    end

    it 'returns all the data' do
      get :index, params: { touchpoint: net_promoter_score[:touchpoint] }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'create a new NetPromoterScore' do
      it 'with valid params' do
        post :create, params: { net_promoter_score: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end

      it 'with invalid params' do
        post :create, params: { net_promoter_score: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
