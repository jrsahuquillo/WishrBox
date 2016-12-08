class AddStatesToWishes < ActiveRecord::Migration[5.0]
  def change
    add_column :wishes, :public, :boolean, default: false
    add_column :wishes, :locked, :boolean, default: false
    add_column :wishes, :favorite, :boolean, default: false
  end
end
