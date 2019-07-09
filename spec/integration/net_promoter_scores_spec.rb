require 'swagger_helper'

describe 'Net Promoter Scores API' do
  path '/api/v1/net_promoter_scores?touchpoint=realtor_feedback' do
    get 'List all net promoter scores' do
      tags 'Net Promoter Scores'
      consumes 'application/json'
      response '200', 'Net promoter scores found'
      response '400', 'Invalid request'
      response '422', 'Unprocessable Entity'
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

      response '201', 'Net promoter score created'
      response '400', 'Invalid request'
      response '422', 'Unprocessable Entity'
    end
  end
end
