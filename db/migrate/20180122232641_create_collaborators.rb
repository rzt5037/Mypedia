class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.belongs_to :user
      t.belongs_to :wiki
    end

    add_index :collaborators, :user_id
    add_index :collaborators, :wiki_id
  end
end
