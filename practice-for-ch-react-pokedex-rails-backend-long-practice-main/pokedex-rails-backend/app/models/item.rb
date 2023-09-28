# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  name       :string           not null
#  price      :integer          not null
#  happiness  :integer          not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord

    validates :name, length: {in: 3..255, message: "%{value} should be of len 3-255"}

    validates :price, numericality: {greater_than: 0, message: "%{value} should be gretaer than 0" }

    belongs_to :pokemon
end
