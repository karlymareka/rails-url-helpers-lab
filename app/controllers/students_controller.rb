require 'pry'
class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    #binding.pry 
    if @student.active === true
      @activity_status = 'active'
    else
      @activity_status = 'inactive'
    end
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active === true
      @student.active = false
    else
      @student.active = true
    end
    @student.save!
    render "show"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
