class CredentialsController < ApplicationController

 def index
    @credentials = Credential.all
 end

 def show
     @credential = Credential.find(params[:id])
 end

 def new  
   @credential = Credential.new
 end

def edit
    @credential = Credential.find(params[:id])
end

 def create
   @credential=Credential.new(credential_params)
     
   if @credential.save
       #redirect_to customers_path
       redirect_to @credential
       #redirect_to credential_path(@credential)
   else
       render 'new'
   end  
 end

 def update
   @credential = Credential.find(params[:id])

   if @credential.update(credential_params)
       redirect_to @credential
       #redirect_to credential_path(@credential)
   else
       render 'edit'
   end
 end

 def destroy
    @credential = Credential.find(params[:id])
    @credential.destroy
    redirect_to credentials_path
 end

 private    

 def credential_params
   params.require(:credential).permit(:userName, :password_digest, :passwordHash, :passQuestion,:passQuestionAnswerHash ,:passwordHashAgain )
 end


end
