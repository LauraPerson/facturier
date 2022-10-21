class Client < ApplicationRecord
  belongs_to :user
  validates :name, presence: :true
  validates :address, presence: :true
end
