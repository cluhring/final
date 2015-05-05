class Task < ActiveRecord::Base
  belongs_to :user

  def date
    due_date.to_formatted_s(:long_ordinal)
  end

  def true?
    if status == false
      return "incomplete"
    else
      return "complete"
    end
  end

  def incomplete?
    status == false
  end
end
