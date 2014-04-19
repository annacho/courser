class CreateSqlHw < ActiveRecord::Migration
  def change
  	create_table :professors do |t|
  		t.integer :professor
  		t.string :name
  		t.string :email
  		t.integer :subject_id
  		t.string :subject_name
  	end  		 
  end
end
