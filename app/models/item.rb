class Item < ApplicationRecord 
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  has_many   :favorite


  belongs_to :category
  belongs_to :where_to_buy
  belongs_to :budgets
  belongs_to :four_season


  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :title
    validates :introduction
    validates :buy_prefecture_id
    validates :price_id
    validates :image
    validates :category_id
    validates :season_id
  end

    #validates :price, numericality: { only_integer: true }

  with_options numericality: { other_than: 0 } do
    validates :buy_prefecture_id
    validates :price_id
    validates :category_id
    validates :season_id
  end
end