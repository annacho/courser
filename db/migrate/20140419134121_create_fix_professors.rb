class CreateFixProfessors < ActiveRecord::Migration
  def change
  	drop_table :professors

  	create_table :professors do |t|
  		t.string :name
  		t.string :email
  		t.integer :subject_id
  		t.string :subject_name
		end
  end
end
