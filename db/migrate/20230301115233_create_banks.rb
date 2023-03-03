class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.string :iban
      t.string :currency
      t.string :card_type
      t.string :card_expire
      t.string :card_number

      t.references :user

      t.timestamps
    end
  end
end
