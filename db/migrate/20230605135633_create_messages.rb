class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
