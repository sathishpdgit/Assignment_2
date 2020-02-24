class Product < ApplicationRecord
validates :name, presence: true
validates :desi, presence: true 
validates :sale, presence: true
validates :add, presence: true
validates :phone, presence: true
validates :city, presence: true
validates :short_description, presence: true
end
