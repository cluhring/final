class Task < ActiveRecord::Base
  belongs_to :user
  has_attached_file :pdf, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pdf, :content_type => /\Aimage\/.*\Z/

  # def date
  #   due_date.to_formatted_s(:long_ordinal)
  # end

  def true?
    if status == false
      return "procrastinating"
    else
      return "done deal"
    end
  end

  def pictured?
    pdf.instance.pdf_file_name != nil
  end

  def incomplete?
    status == false
  end

  def self.name_sort
    all.order(title: :asc)
  end

  def self.date_sort
    all.order(due_date: :asc)
  end

  def self.status_sort
    all.order(status: :asc)
  end
end
