require 'rails_helper'

RSpec.describe NetPromoterScore, type: :model do
  subject { create(:net_promoter_score, respondent_id: 1 , object_id: 1) }

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:touchpoint) }
    it { is_expected.to validate_presence_of(:respondent_class) }
    it { is_expected.to validate_presence_of(:respondent_id) }
    it { is_expected.to validate_presence_of(:object_class) }
    it { is_expected.to validate_presence_of(:object_id) }

    it { is_expected.to validate_inclusion_of(:touchpoint).in_array(NetPromoterScore::TOUCHPOINTS) }
    it { is_expected.to validate_inclusion_of(:respondent_class).in_array(NetPromoterScore::RESPONDENT_CLASSES) }
    it { is_expected.to validate_inclusion_of(:object_class).in_array(NetPromoterScore::OBJECT_CLASSES) }
  end
end
