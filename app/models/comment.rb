class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id
  belongs_to :post
  
  validates :post_id, :presence => true 
  validates :content, :presence => true 

end
