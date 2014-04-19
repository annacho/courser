class CreateCourses < ActiveRecord::Migration
  def change
  	create_table :courses do |t|
  		t.string :name
  		t.integer :professor_id
  		t.string :professor_name
  	end
  end
end
