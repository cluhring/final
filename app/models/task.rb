class Task < ActiveRecord::Base
  belongs_to :user

  def date
    due_date.to_formatted_s(:long_ordinal)
  end
end
