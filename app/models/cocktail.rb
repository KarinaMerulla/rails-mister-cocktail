class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  # o dependent entende que as doses dependenm pra serem deletadas
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
end
