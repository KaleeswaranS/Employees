class DashboardController < ApplicationController
 skip_before_action :verify_authenticity_token
 # before_action :authenticate_user!

def create
  # customer = Customer.create(user_create)
end

def show
	result_array = []
  Employee.all.map do |e|
  result = {}
  result[:name] = e.name
  result[:email] = e.email
  result[:qualification] = e.qualification
  result[:dob] = e.dob
  result[:project] = e.project
  result[:mobile_number] = e.mobile_number
  result[:address] = e.address
  result_array << result
  end
  render json: [{data: result_array}]
end
# def login_attempt
#   authorized_user = Customer.authenticate(params[:email],params[:password])
#   if authorized_user
#     flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.email}"
#     redirect_to(:action => 'dashboard/emp')
#   else
#     flash[:notice] = "Invalid Email or Password"
#     flash[:color]= "invalid"
#     render "login"	
#   end
# end

def employees_create
  respond_to do |format|
    format.html 
    render  'employees/_create' 
  end
end

def project
  result = {}
  Employee.all.map do |e|
  result[e.name] = e.project
  end
  render json: result
end

def index
	 @employees = Employee.all
end

def chart
  result = {}
  Employee.all.map do |e|
  result[e.project] = e.name
  end
  render json: result
end

def update
  @employee = Employee.where(id: params[:id])
  if @employee.update(employee_create)
   render json: @employee
  else
    render :edit
  end   
end

def dashboard
  customer = Customer.create(user_create)
end


private

  def user_create
    params.require(:customer).permit(:username, :email, :password, :confirm_password)
  end

	def employee_create
		params.require(:employee).permit(:name, :email, :qualification, :dob, :project, :mobile_number)
	end
end
