class Category < ActiveRecord::Base
  has_many :tasks, :dependent => :nullify
  
  validates :name, :presence => true, :length => { :maximum => 10 }
end
