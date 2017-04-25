class AddBodyToNote < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :body, :text
  end
end
