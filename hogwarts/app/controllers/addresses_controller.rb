class AddressesController < ApplicationController
before_action :load_customer

 # GET /customers/:customer_id/addresses
 def index
  #customer= Customer.find(params[:customer_id])
  @addresses = @customer.addresses
 end

 # GET /customers/:customer_id/addresses/:id
 def show
  #customer= Customer.find(params[:customer_id])
  @address = @customer.addresses.find(params[:id])
 end

# GET /customers/:customer_id/addresses/new
 def new
   #customer= Customer.find(params[:customer_id])
   @address = @customer.addresses.build
 end

 # GET /customers/:customer_id/addresses/:id/edit
 def edit
   #customer= Customer.find(params[:customer_id])
   @address = @customer.addresses.find(params[:id])
 end

# POST /customers/:customer_id/addresses
 def create
    #customer = Customer.find(params[:customer_id])
   # @address = customer.addresses.create(address_params)
    @address = @customer.addresses.build(address_params)

    if @address.save
       redirect_to([@address.customer,@address])
    else
       render 'new'
    end

    #redirect_to customer_path(@customer)
  end

# PUT /customers/:customer_id/:id
 def update
   #customer= Customer.find(params[:customer_id])
   @address = @customer.addresses.find(params[:id])

   if @address.update(address_params)
      redirect_to([@address.customer,@address])
   else
    render 'edit'
  end
 end

# DELETE /customers/:customer_id/addresses/1
 def destroy
   #customer= Customer.find(params[:customer_id])
   @address = customer.addresses.find(params[:id])
   @address.destroy
   redirect_to(customer_addresses_path)
  #redirect_to(customer_addresses_url)
 end

 private

 def load_customer
      @customer= Customer.find(params[:customer_id])
  end

  def address_params
    params.require(:address).permit(:streetNumber, :streetName, :city, :provinceOrState, :postalCode, :other)
  end

end
