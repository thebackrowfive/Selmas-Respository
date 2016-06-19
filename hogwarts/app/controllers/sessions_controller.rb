class SessionsController < ApplicationController


 def new

 end

 def create
   
   if credential = Credential.passwordHash_authenicate(params[:userName],params[:passwordHash])
      session[:credential_id] = credential.id
      redirect_to credential , :notice => "Logged in successfully"
    else
      flash.now[:alert] = "Invalid user name and/or password"
      render 'new'
    end

 end

 def destroy
   reset_session
   redirect_to root_path, :notice => "You successfully logged out"
 end


end
