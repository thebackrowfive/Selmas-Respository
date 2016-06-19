class EmailsController < ApplicationController
before_action :load_customer

 # GET /customers/:customer_id/emails
 def index
  #customer= Customer.find(params[:customer_id])
  @emails = @customer.emails
 end

 # GET /customers/:customer_id/emails/:id
 def show
  #customer= Customer.find(params[:customer_id])
  @email = @customer.emails.find(params[:id])  
 end

# GET /customers/:customer_id/emails/new
 def new
   #customer= Customer.find(params[:customer_id])
   @email = @customer.emails.build
 end

 # GET /customers/:customer_id/emails/:id/edit
 def edit
   #customer= Customer.find(params[:customer_id])
   @email = @customer.emails.find(params[:id])
 end


# POST /customers/:customer_id/emails
 def create
    #customer = Customer.find(params[:customer_id])
   # @email = customer.emails.create(email_params)
    @email = @customer.emails.build(email_params)

    if @email.save
       redirect_to([@email.customer,@email])
    else
       render 'new'
    end

    #redirect_to customer_path(@customer)
  end

# PUT /customers/:customer_id/:id
 def update
   #customer= Customer.find(params[:customer_id])
   @email = @customer.emails.find(params[:id])

   if @email.update(email_params)
      redirect_to([@email.customer,@email])
   else
    render 'edit'
  end
 end

# DELETE /customers/:customer_id/emails/1
 def destroy
   #customer= Customer.find(params[:customer_id])
   @email = @customer.emails.find(params[:id])
   @email.destroy
   redirect_to(customer_emails_path)
  #redirect_to(customer_emails_url)
 end

  private

   def load_customer
      @customer= Customer.find(params[:customer_id])
    end

    def email_params
      params.require(:email).permit(:emailType, :email)
  end


end
