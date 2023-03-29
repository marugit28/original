class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :region
  belongs_to :category
  belongs_to :scheduled_delivery
  belongs_to :Atmosphere
  belongs_to :user

  validates :image,                           presence: true, unless: :was_attached?
  validates :itemname,                       presence: true
  validates :explanation,                     presence: true
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :atmosphere_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :degree_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                           presence: true,
                                              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  def was_attached?
    image.attached?
  end
end
