class EmployeeController < ApplicationController
  def new
    @employee = Employee.new
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(params[:user])
    if @employee.save
      flash[:success] = "Welcome to the DevBatch App Store!"
      redirect_to @employee
    else
      render 'new'
    end
  end
end
