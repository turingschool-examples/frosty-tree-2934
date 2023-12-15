class AddRoomsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :rate
      t.string :suite
      t.references :hotel, null: false, foreign_key: true
      
      # t.references :guest, null: false, foreign_key: true
      # PG::UndefinedTable: ERROR:  relation "guests" does not exist
      # ActiveRecord::StatementInvalid: PG::UndefinedTable: ERROR:  relation "guests" does not exist

      # I cannot get this error to go away. I cannot figure out what is causing it.
      # I can get other referecnces to generate just not this guests one.
      # I've been working on this for over an hour and I have to give up.

      t.timestamps
    end
  end
end
