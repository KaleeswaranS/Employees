class EmployeesController < ApplicationController
	skip_before_action :verify_authenticity_token
 #  before_action :employee_params, only: [:edit]
	
	def index
		 @employees = Employee.last
	end

  def new
    @employee = Employee.new
  end

	def create
  	@employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html  { redirect_to(@employee, :notice => 'Employee was successfully created.') }
        format.json  { render :json => @employee, :status => :created, :location => @employee }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  def project
    result = {}
    @employees = Employee.all
    @employees.map do |e|
      result[e.name] = e.project
    end
    # render json: result
  end
  
  def show
    @employees = Employee.find(params[:id])
 
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @employees }
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end

  def update
  @employee = Employee.find(params[:id])
  @employee.update(employee_params)
  redirect_to employee_path(@employee)
end

  def profiles
    @employees = Employee.all
  end

  def employee_view
    @name = params[:id]
    @view_employee = Employee.find(@name)
  end

  def employees_by_project
  end

private

  def employee_params
		params.require(:employee).permit(:name, :email, :qualification, :dob, :project, :mobile_number)
	end

	# def user_create
	# 	params.require(:customer).permit(:username, :email, :password, :confirm_password)
	# end

end
