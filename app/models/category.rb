class Category < ActiveRecord::Base
  has_many :tasks
  
  validates :name, :presence => true, :length => { :maximum => 10 }
end
