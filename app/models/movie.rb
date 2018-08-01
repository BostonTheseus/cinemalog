class Movie < ApplicationRecord
    belongs_to :user
    validates :title, :description, :rating, presence: true
end
