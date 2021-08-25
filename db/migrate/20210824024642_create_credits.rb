class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.string     :customer_token, null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
