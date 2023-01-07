class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :title,              null: false
      t.text       :introduction,       null: false
      t.integer    :category_id,        null: false
      t.integer    :where_to_buy_id,    null: false
      t.integer    :budgets_id,         null: false
      t.integer    :four_season_id,     null: false
     
      t.timestamps
    end
  end
end
