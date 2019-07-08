class NetPromoterScore < ApplicationRecord
  TOUCHPOINTS = %w[realtor_feedback].freeze
  RESPONDENT_CLASSES = %w[seller].freeze
  OBJECT_CLASSES = %w[realtor].freeze

  validates_inclusion_of :touchpoint, in: TOUCHPOINTS
  validates_inclusion_of :respondent_class, in: RESPONDENT_CLASSES
  validates_inclusion_of :object_class, in: OBJECT_CLASSES
  validates_presence_of :score, :touchpoint, :respondent_class, :respondent_id, :object_class, :object_id
  validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates_numericality_of :respondent_id, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :object_id, only_integer: true, greater_than_or_equal_to: 0
end
