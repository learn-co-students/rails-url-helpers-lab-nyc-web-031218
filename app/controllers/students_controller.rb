require 'byebug'
class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def new
  end

  def students
   @students = Student.all
  end

  def show
    set_student
  end

  def activate

    set_student
    @student.update(active: !@student.active)
    @student.save
    @student.reload
    redirect_to student_path(@student)

  end

  # def redirect
  #   set_student
  #     redirect_to "student_path(@student)"
  # end

  def create
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name])
  end

    def set_student
      @student = Student.find(params[:id])
    end
end
