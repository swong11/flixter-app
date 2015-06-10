class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrollment_for_lesson

	def show
	end

	private

	def require_enrollment_for_lesson
		if current_user.enrolled_in?(current_lesson.section.course) != true
			redirect_to course_path(current_lesson.section.course), :alert => "Enroll in course to view lesson"
		end
	end	

	helper_method :current_lesson
  	def current_lesson
    	@current_lesson ||= Lesson.find(params[:id])
  	end
end
