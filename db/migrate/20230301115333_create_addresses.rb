class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :lat
      t.string :lng
      t.string :city
      t.string :state
      t.string :address
      t.string :postal_code

      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
