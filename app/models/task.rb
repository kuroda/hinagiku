class Task < ActiveRecord::Base
  self.per_page = 10

  belongs_to :category
  
  scope :done, where(:done => true).order("due_date DESC")
  scope :undone, where(:done => false).order("due_date")
  scope :search, lambda { |query|
    where([ "name LIKE ?", "%#{query}%" ])
  }

  validates :name, :presence => true, :length => { :maximum => 20 }
  validates :description, :length => { :maximum => 200 }
  validate :check_association

  private
  def check_association
    if category_id && !Category.where(:id => category_id).exists?
      errors.add(:base, :missing_category)
      self.category_id = nil
    end
  end
end
