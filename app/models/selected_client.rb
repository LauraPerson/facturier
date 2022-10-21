class SelectedClient < ApplicationRecord
  belongs_to :invoice, optional: true
  belongs_to :client, optional: true
end


