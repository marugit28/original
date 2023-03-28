class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  belongs_to :user

  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end
