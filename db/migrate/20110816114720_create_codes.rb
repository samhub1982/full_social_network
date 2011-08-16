class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.string :encrypted_code
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
