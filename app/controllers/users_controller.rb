class UsersController < ApplicationController

  #Account control page
  def index
    @users = User.all
  end

  def new
     @title = "Create a user"
     @user = User.new
  end

  def show
    #@title = "Information for #{@user.full_name}"
    @user = User.find(params[:id])
    @users = User.all
  end
  
  def password
    @title = "Change your password"
    @user = User.find(params[:id])
  end
 
  #Editting a user
  #Normal users can change there own password.
  def edit
    @user = User.find(params[:id]) 
  end

  #Updating the user
  def update
    @user = User.find(params[:id])
    params[:password] == params[:current_password]
    
    if @user.update_attributes(params[:user])
        if user_signed_in?                   
            flash[:notice] = "Please login with your changed password."
            redirect_to login_path            
          else
            flash[:success] = "User updated."
            redirect_to root_path
        end
    else
        flash[:notice] = 'Something went wrong!'
        render 'password'
    end
  end

  def create
    @title = "Create a user"
    @user = User.new(params[:user])
    @role = Role.all
    @roles = Role.all
    
    if @user.save
      #sign_in @user
      # Handle a successful save.
      redirect_to root_path
      flash[:success] = "Created successfully."
    else
      @title = "Create a user"
      render 'new'# Clear page
    end
  end
  
  #Removing a user and redirect to user list
  #Only admins can remove users
  def destroy
    @user = User.find(params[:id])
    User.find(params[:id]).destroy
    flash[:success] = "#{@user.full_name} deleted."
    redirect_to usermanagement_path
  end
  
  private
    
    def current_user?(user)
      user == current_user
    end
end
