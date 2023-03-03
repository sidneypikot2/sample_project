class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :title
      t.string :department

      t.references :user

      t.timestamps
    end
  end
end
