class CustomersController < ApplicationController

 def index
    @customers = Customer.all
  end

 def show
    @customer = Customer.find(params[:id])
    @customer.phones.build
    @customer.addresses.build
    @customer.emails.build
 end

 def new
  @customer = Customer.new
  @customer.phones.build
  @customer.addresses.build
  @customer.emails.build
  #2.times { @customer.phones.build}
  #2.times { @customer.phones.new}
 end

 def edit
  @customer = Customer.find(params[:id])
 end

 def create
   @customer = Customer.new(customer_params)
 
   if @customer.save
    redirect_to @customer
  else
    render 'new'
  end
 end

 def update
  @customer = Customer.find(params[:id])
 
  if @customer.update(customer_params)
    redirect_to @customer
  else
    render 'edit'
  end
 end

 def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
 
    redirect_to customers_path
  end

 
 private
  def customer_params
    params.require(:customer).permit(:lastName, :firstName, :middleName, :gender, :customerRegistrationDate,
         phones_attributes: [:id, :phoneNumberType, :phoneNumber],
         addresses_attributes: [:id, :streetNumber, :streetName, :city, :provinceOrState, :postalCode, :other ],
         emails_attributes: [:id, :emailType, :email])
  end



end
