class NetPromoterScore < ApplicationRecord
  TOUCHPOINTS = %w[realtor_feedback seller_feedback].freeze
  FILTRATION_FIELDS = %i[touchpoint respondent_type object_type].freeze

  belongs_to :respondent, polymorphic: true
  belongs_to :object, polymorphic: true

  validates_presence_of :score, :touchpoint
  validates_inclusion_of :touchpoint, in: TOUCHPOINTS
  validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates_uniqueness_of :touchpoint, scope: %i[respondent_type respondent_id object_type object_id]
  validate :respondent_does_not_equal_object, on: :create

  scope :by_touchpoint, (->(touchpoint) { where(touchpoint: touchpoint) })
  scope :by_respondent_type, (->(respondent_type) { where(respondent_type: respondent_type) })
  scope :by_object_type, (->(object_type) { where(object_type: object_type) })

  before_update :prevent_update

  private

  def prevent_update
    %w[touchpoint respondent_type respondent_id object_type object_id].each do |column|
      next unless send("#{column}_changed?")

      errors.add(:base, 'Cannot update duo to data integrity')
      throw(:abort)
    end
  end

  def respondent_does_not_equal_object
    return unless respondent == object

    errors.add(:base, 'Respondent cannot be the same as the object')
    throw(:abort)
  end
end
