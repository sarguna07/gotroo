class CreateShrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :shrinks, id: :uuid do |t|
      t.string :name
      t.string :shortend_url
      t.string :url
      t.timestamps
    end
  end
end
