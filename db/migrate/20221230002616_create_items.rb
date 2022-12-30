class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :title,              null: false
      t.text       :introduction,       null: false
      t.integer    :buy_prefecture_id,  null: false
      t.integer    :price_id,           null: false
      t.text       :image,              null: false
      t.integer    :category_id,        null: false
      t.integer    :season_id,          null: false
     
      t.timestamps
    end
  end
end
