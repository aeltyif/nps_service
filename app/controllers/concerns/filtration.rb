module Filtration
  extend ActiveSupport::Concern

  def filter(data, params)
    controller_name.classify.constantize::FILTRATION_FIELDS.each do |column|
      value = params[column] || nil
      data = data.send("by_#{column}", value) if value.present?
    end
    data
  end
end
