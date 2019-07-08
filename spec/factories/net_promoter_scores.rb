FactoryBot.define do
  factory :net_promoter_score do
    score            { Faker::Number.between(1, 10) }
    touchpoint       { 'realtor_feedback' }
    respondent_class { 'seller' }
    object_class     { 'realtor' }

    trait :invalid do
      score { nil }
    end
  end
end
