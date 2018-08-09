class CreateCreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :create_cryptos do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
