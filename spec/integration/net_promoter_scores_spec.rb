require 'swagger_helper'

describe 'Net Promoter Scores API' do

  path '/api/v1/net_promoter_scores?touchpoint=realtor_feedback' do
    get 'List all net promoter scores' do
      tags 'Net Promoter Scores'
      consumes 'application/json'
      response '200', 'Net promoter scores found' do
        let(:id) { net_promoter_score.create(score: 10,
                                             touchpoint: 'realtor_feedback',
                                             respondent_type: 'Seller' ,
                                             respondent_id: create(:seller, name: 'Hello Respondent').id ,
                                             object_type: 'Realtor' ,
                                             object_id: create(:realtor, name: 'Hello Realtor').id).id }
        run_test!
      end

      response '400', 'Invalid request' do
        let(:net_promoter_score) { { score: 11 } }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:net_promoter_score) { { score: 11 } }
        run_test!
      end
    end
  end

  path '/api/v1/net_promoter_scores' do
    post 'Creates a net promoter score' do
      tags 'Net Promoter Scores'
      consumes 'application/json'
      parameter name: :net_promoter_score, in: :body, schema: {
        type: :object,
        properties: {
          score: { type: :integer },
          touchpoint: { type: :string },
          respondent_type: { type: :string },
          respondent_id: { type: :integer },
          object_type: { type: :string },
          object_id: { type: :integer }
        },
        required: %w[score touchpoint respondent_type respondent_id object_type object_id]
      }

      response '201', 'Net promoter score created' do
        let(:net_promoter_score) { { score: 10,
                                     touchpoint: 'realtor_feedback',
                                     respondent_type: 'Seller' ,
                                     respondent_id: create(:seller, name: 'Hello Respondent').id ,
                                     object_type: 'Realtor' ,
                                     object_id: create(:realtor, name: 'Hello Realtor').id } }
        run_test!
      end

      response '400', 'Invalid request' do
        let(:net_promoter_score) { { score: 11 } }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:net_promoter_score) { { score: 11 } }
        run_test!
      end
    end
  end
end
