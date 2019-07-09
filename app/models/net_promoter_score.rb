class NetPromoterScore < ApplicationRecord
  TOUCHPOINTS = %w[realtor_feedback].freeze

  belongs_to :respondent, polymorphic: true
  belongs_to :object, polymorphic: true

  validates_presence_of :score, :touchpoint, :respondent_type, :respondent_id, :object_type, :object_id
  validates_inclusion_of :touchpoint, in: TOUCHPOINTS
  validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates_uniqueness_of :touchpoint, scope: %i[respondent_type respondent_id object_type object_id]

  scope :touchpoint, (->(touchpoint) { where(touchpoint: touchpoint) })
  scope :respondent_type, (->(respondent_type) { where(respondent_type: respondent_type) })
  scope :object_type, (->(object_type) { where(object_type: object_type) })

  before_update :prevent_update

  private

  def prevent_update
    %w[touchpoint respondent_type respondent_id object_type object_id].each do |column|
      next unless send("#{column}_changed?")

      errors.add(:base, 'Cannot update duo to data integrity')
      throw(:abort)
    end
  end
end
