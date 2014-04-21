require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///sql_hw.db" 

get "/courses" do
	@example_courses = Course.example_courses
	@courses = Course.all
	@professors = Professor.all
	@subjects = Subject.all
	erb :"courses/index"
end

get "/courses/search" do
	@courses = Course.all
	erb :"/results"
end

get '/results' do
	erb :"results"
end

post "/courses/search" do
	@query = params[:search]
	@results = Course.where('INNER JOIN professors ON courses.professor_id = professors.id' INNER JOIN subjects ON professors.subject.id = subjects.id
WHERE courses.name= ?', params[:search]))
	erb :"/results"
end

get "/courses/new" do
	@example_courses = Course.example_courses
	@new_course = Course.new
	erb :"/courses/new"
end

get "/courses/new" do
	@example_courses = Course.example_courses
	@new_course = Course.new
	erb :"/courses/new"
end

get "/courses/:id" do
	@example_courses = Course.example_courses
	@new_course = Course.new
	erb :"/courses/show"
end

put "/courses/:id" do
	@course = Course.find(params[:id])
	if @course.update_attributes(params[:courses])
		redirect "/courses"
	else
		redirect "/course/Error"
	end
end

get "/courses/error" do
	redirect "/course/Error"
end

get "/courses/Error" do
	@example_courses = Course.example_courses
	@courses = Course.courses
	erb :"/courses/error"
end

get "/courses/:id/edit" do
	@example_courses = Course.example_courses
	@course = Course.find(params[:id])
	erb :"/courses/edit"
end

delete "/courses/:id" do
	@course = Course.find(params[:id])
	if @course.delete
		redirect "/courses"
	else
		redirect "/courses/:id"
	end
end

post "/courses" do 
	@new_course = Course.new(params[:courses])
	if @new_course.save
		redirect "/courses"
	else 
		redirect "/courses/Error"
	end	
end

class Course < ActiveRecord::Base
	@@example_courses = "Spring 2014: Introduction to Computer Science - James Allison - 9:00AM"

	def self.example_courses
		@@example_courses
	end
end

class Professor < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end