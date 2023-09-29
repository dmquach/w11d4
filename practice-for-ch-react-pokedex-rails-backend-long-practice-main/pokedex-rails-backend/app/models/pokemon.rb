# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord

    TYPES = [
    'fire',
    'electric',
    'normal',
    'ghost',
    'psychic',
    'water',
    'bug',
    'dragon',
    'grass',
    'fighting',
    'ice',
    'flying',
    'poison',
    'ground',
    'rock',
    'steel'
  ].sort.freeze

    validates :image_url, presence: true

    validates :captured, inclusion: {in: [true, false], message: "Captured must be true or false"}

    validates :name, length: {in: 3..255}, uniqueness: {message: "%{value} has been taken"}, presence: true

    validates :attack, :defense, numericality: {in: 0..100, message: "%{value} should be within 0-100" }

    validates :number, numericality: {greater_than: 0, message: "%{value} should be gretaer than 0" }

    validates :poke_type, inclusion: {in: TYPES, message: "%{value} is not a valid poke type"}

    has_many :poke_moves,
        dependent: :destroy

    has_many :moves,
        through: :poke_moves

    has_many :items,
        dependent: :destroy

    def default_url
        return "/images/unknown.png"
    end

end
