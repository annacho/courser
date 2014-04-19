class FixSubjects < ActiveRecord::Migration
  def change
  	drop_table :subjects

  	create_table :subjects do |t|
  		t.string :name
  		t.integer :courses_offered
  	end
  end
end
