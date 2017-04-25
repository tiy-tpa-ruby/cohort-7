class AddRelationsToTagging < ActiveRecord::Migration[5.0]
  def change
    add_reference :taggings, :note, foreign_key: true
    add_reference :taggings, :tag, foreign_key: true
  end
end
