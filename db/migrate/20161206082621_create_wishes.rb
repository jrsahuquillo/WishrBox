class CreateWishes < ActiveRecord::Migration[5.0]
  def change
    create_table :wishes do |t|
      t.references :user, index: true
      t.string  :title
      t.text    :description
      t.string  :link
      t.string  :image
      t.float   :price

      t.timestamps
    end
  end
end
