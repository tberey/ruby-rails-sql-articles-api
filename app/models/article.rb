class Article < ApplicationRecord
    validates :title, presence: true # Mandetory Fields
    validates :body, presence: true
end
