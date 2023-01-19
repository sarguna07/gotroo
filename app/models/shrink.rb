class Shrink < ApplicationRecord
  validates :name, :url, presence: true
end
