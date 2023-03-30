class OrderPlace
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :region_id, :municipality, :address, :building, :tell

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :tell, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Place.create(postcode: postcode, region_id: region_id, municipality: municipality, address: address, building: building,
                 tell: tell, order_id: order.id)
  end
end