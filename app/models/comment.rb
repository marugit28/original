class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :lank_id
  belongs_to :user
  belongs_to :item  

  validates :text,  presence: true
  validates :lank_id, numericality: { other_than: 1 ,message: "can't be blank"} 

end
