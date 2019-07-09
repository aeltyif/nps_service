class Api::V1::NetPromoterScoresController < ApplicationController
  include Filtration

  before_action :set_net_promoter_score, only: %i[create]

  def index
    if params[:touchpoint].present?
      paginate json: filter(NetPromoterScore.all, params)
    else
      render json: { errors: 'Touchpoint is required to proceed' }, status: :unprocessable_entity
    end
  end

  def create
    @net_promoter_score.score = net_promoter_score_params[:score]
    if @net_promoter_score.save
      render json: @net_promoter_score, status: :created
    else
      render json: { errors: @net_promoter_score.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_net_promoter_score
    filters = {}
    %i[touchpoint respondent_type respondent_id object_type object_id].each do |column|
      filters[column] = net_promoter_score_params[column] || nil
    end
    @net_promoter_score = NetPromoterScore.find_or_create_by(filters)
  end

  def net_promoter_score_params
    params.require(:net_promoter_score).permit(:score, :touchpoint, :respondent_type, :respondent_id, :object_type, :object_id)
  end
end
