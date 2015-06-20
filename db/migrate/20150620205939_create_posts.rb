class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :uploader_ip
      t.string :location

      t.timestamps null: false
    end
  end
end
