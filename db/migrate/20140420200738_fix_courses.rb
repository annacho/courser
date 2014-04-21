class FixCourses < ActiveRecord::Migration
  def change
  	drop_table :courses

  	create_table :courses do |t|
  		t.string :term
  		t.string :name
  		t.integer :professor_id
  		t.string :professor_name
  		t.time :time1
  		t.time :time2
  	end
  end
end
