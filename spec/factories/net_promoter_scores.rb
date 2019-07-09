FactoryBot.define do
  factory :net_promoter_score do
    score      { Faker::Number.between(1, 10) }
    touchpoint { 'realtor_feedback' }

    trait :invalid do
      score { 11 }
    end
  end
end
