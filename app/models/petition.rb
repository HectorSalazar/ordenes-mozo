class Petition < ApplicationRecord
    belongs_to :plate
    belongs_to :waiter
    belongs_to :diningtable
end
