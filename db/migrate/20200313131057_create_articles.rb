require 'time'

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      #t.datetime.now :deleted_at
      t.timestamps
    end
  end
end
