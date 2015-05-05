class List < ActiveRecord::Base
  has_many :tasks

  def archived?
    status == false
  end

  def active?
    if status == false
      return "active"
    else
      return "inactive"
    end
  end
end
