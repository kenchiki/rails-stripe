class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :amount
      t.string :stripe_plan_id
      t.string :product_name

      t.timestamps
    end
  end
end
