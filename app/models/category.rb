class Category < ActiveRecord::Base

  has_many :products

  validates :id, presence: true

end
