require 'rails_helper'

RSpec.describe NetPromoterScore, type: :model do
  let(:realtor) { create(:realtor, name: 'Hello Realtor') }
  let(:seller)  { create(:seller, name: 'Hello Respondent') }
  subject       { create(:net_promoter_score, respondent: seller , object: realtor) }

  describe 'Associations' do
    it { is_expected.to belong_to(:respondent) }
    it { is_expected.to belong_to(:object) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:touchpoint) }
    it { is_expected.to validate_presence_of(:respondent_type) }
    it { is_expected.to validate_presence_of(:respondent_id) }
    it { is_expected.to validate_presence_of(:object_type) }
    it { is_expected.to validate_presence_of(:object_id) }
    it { is_expected.to validate_inclusion_of(:touchpoint).in_array(NetPromoterScore::TOUCHPOINTS) }
    it { should validate_numericality_of(:score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(10) }
    it { should validate_uniqueness_of(:touchpoint).scoped_to(:respondent_type, :respondent_id, :object_type, :object_id) }
  end

  describe 'Named scopes' do
    it 'touchpoint' do
      expect(NetPromoterScore.touchpoint(subject.touchpoint)).to eq([subject])
    end

    it 'respondent_type' do
      expect(NetPromoterScore.respondent_type(subject.respondent_type)).to eq([subject])
    end

    it 'object_type' do
      expect(NetPromoterScore.object_type(subject.object_type)).to eq([subject])
    end
  end
end
