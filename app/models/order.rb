class Order < ApplicationRecord
  belongs_to :user
  has_many :place
  belongs_to :item
end