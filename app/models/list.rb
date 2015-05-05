class List < ActiveRecord::Base
  has_many :tasks

  def archived?
    status == false
  end
end
