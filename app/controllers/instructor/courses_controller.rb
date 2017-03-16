class Instructor::CourseController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.new
  end

  def create
    @courses = current_user.courses.create(course_params)
    if
      redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.requre(:course).permit(:title, :description, :cost)
  end
end
