class Task < ActiveRecord::Base
  belongs_to :user
  has_attached_file :pdf, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pdft, :content_type => /\Aimage\/.*\Z/

  def date
    due_date.to_formatted_s(:long_ordinal)
  end

  def true?
    if status == false
      return "procrastinating"
    else
      return "done deal"
    end
  end

  def incomplete?
    status == false
  end
end
