class Diningtable < ApplicationRecord
    has_many :petitions
    belongs_to :hall
end
