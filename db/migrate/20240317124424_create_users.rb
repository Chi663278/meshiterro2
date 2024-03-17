class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :PostImage
      t.string :PostComment

      t.timestamps
    end
  end
end
