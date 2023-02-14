class Item < ApplicationRecord 
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  #has_many   :favorite


  belongs_to :category
  belongs_to :where_to_buy
  belongs_to :budgets
  belongs_to :four_season


  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :introduction
    validates :category_id
    validates :where_to_buy_id
    validates :budgets_id
    validates :four_season_id
  end

  with_options numericality: { other_than: 0, message: " は ”---” 意外を選択してください"} do
    validates :where_to_buy_id
    validates :category_id
    validates :budgets_id
    validates :four_season_id
  end
end