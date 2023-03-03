class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :ip
      t.string :ein
      t.string :ssn
      t.string :image
      t.string :phone
      t.string :email
      t.string :domain
      t.string :gender
      t.string :hair_type
      t.string :hair_color
      t.string :eye_color
      t.string :password
      t.string :username
      t.string :last_name
      t.string :first_name
      t.string :user_agent
      t.string :maiden_name
      t.string :mac_address
      t.string :university

      t.integer :age
      t.integer :height
      t.integer :weight

      t.datetime :birth_date
      t.timestamps
    end
  end
end
