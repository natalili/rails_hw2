class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title
  has_many :comments
  
  validates :name, :presence => true 
  validates :content, :presence => true 
  validates :title, :presence => true 

end
