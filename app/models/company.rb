class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

                  
  belongs_to :region
  has_many :items
  has_many :orders
  has_many :comments
  
  validates :company_name, presence: true
  validates :email,    presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :region_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :explanation, presence: true
  
end
