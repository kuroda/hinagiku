class Task < ActiveRecord::Base
  scope :done, where(:done => true).order("due_date DESC")
  scope :undone, where(:done => false).order("due_date DESC")
end
