class Invoice < ApplicationRecord
  belongs_to :user
  validates :date, presence: :true
  validates :object, presence: :true

  has_one :selected_client
  has_one :client, through: :selected_client

  has_many :items



end
