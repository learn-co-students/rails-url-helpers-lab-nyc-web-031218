class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]

  def index
    #binding.pry
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def activate
    #byebug
    @student = Student.find(params[:id])

    if @student.active
      @student.active = false
    else
      @student.active = true
    end

    #byebug

    @student.save
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
