class NetPromoterScore < ApplicationRecord
  enum touchpoint: %i[realtor_feedback]
end
