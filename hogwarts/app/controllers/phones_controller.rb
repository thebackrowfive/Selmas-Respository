class PhonesController < ApplicationController
helper_method :customAction
before_action :load_customer

 # GET /customers/:customer_id/phones
 def index
  #customer= Customer.find(params[:customer_id])
  #@customer= Customer.find(params[:id])
  @phones = @customer.phones
 end

 # GET /customers/:customer_id/phones/:id
 def show
  #customer= Customer.find(params[:customer_id])
  #@customer= Customer.find(params[:id])
  @phone = @customer.phones.find(params[:id]) 
 end

# GET /customers/:customer_id/phones/new
 def new
   #customer= Customer.find(params[:customer_id])
   #@customer= Customer.find(params[:id])
   @phone = @customer.phones.build
 end

 # GET /customers/:customer_id/phones/:id/edit
 def edit
   #customer= Customer.find(params[:customer_id])
   #@customer= Customer.find(params[:id])
   @phone = @customer.phones.find(params[:id])
 end


# POST /customers/:customer_id/phones
 def create
    #customer = Customer.find(params[:customer_id])
    # @customer= Customer.find(params[:id])
   # @phone = customer.phones.create(phone_params)
    @phone = @customer.phones.build(phone_params)

    if @phone.save
       redirect_to([@phone.customer,@phone])
       #redirect_to @customer
    else
       render 'new'
    end

    #redirect_to customer_path(@customer)
  end

# PUT /customers/:customer_id/:id
 def update
   #customer= Customer.find(params[:customer_id])
   # @customer= Customer.find(params[:id])
   @phone = @customer.phones.find(params[:id])

   if @phone.update(phone_params)
      redirect_to([@phone.customer,@phone])
   else
    render 'edit'
  end
 end

# DELETE /customers/:customer_id/phones/1
 def destroy
   #customer= Customer.find(params[:customer_id])
    #@customer= Customer.find(params[:id])
   @phone = @customer.phones.find(params[:id])
   @phone.destroy
   redirect_to(customer_phones_path)
  #redirect_to(customer_phones_url)
 end

 def customAction
    #"Hello World"
    #customer= Customer.find(params[:customer_id])
    redirect_to customer_path(@customer)
 end
 
  private

    def load_customer
      @customer= Customer.find(params[:customer_id])
    end

    def phone_params
      params.require(:phone).permit(:phoneNumberType, :phoneNumber)
      #customers_attributes[:id,:lastName, :firstName, :middleName, :gender, :customerRegistrationDate])
  end
    
end
