class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    
    RATINGS = {
        '1': 1,
        '2': 2,
        '3': 3
    }
    
end
