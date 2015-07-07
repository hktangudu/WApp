class WallApplicationController < ApplicationController
  def Signup
  	@user = User.new
  	render :Signup
  end

  def Signin
  	@user = User.new
  	render :Signin
  end

  def Home

  end

  def Logout
    @user = User.new
    render :Signin
  end

  def GotoProfileUpdate
  	@user = User.find(params[:id])
    #@users = User.find()#.page(params[:page]) # Order by created at date
  	redirect_to :action => 'ProfileUpdate' , :id => @user._id
  end

  def ProfileUpdate
    @user = User.find(params[:id])
  	render :ProfileUpdate
  end

  def Update
    @user = User.find(params[:id])
  	@result = @user.update(userUpdate_params)

    if @result != 0
      redirect_to :action => 'Wall', :id => @user._id
    else
      redirect_to :action => 'GotoProfileUpdate' , :id => @user._id
    end
  end

  def Wall
    @user = User.find(params[:id])
    render :Wall

   # @user = User.find(params[:id])

   # respond_to do |format|
   # format.html # show.html.erb
   # format.xml  { render :xml => @user }

  end

  def crateuser
  	@user = User.create(user_params)
  	if @user.save
      render :Home
    else
      render :Signup
    end

  	
  end

  def check_login
  	@user = User.find_by(:UserName => params[:user][:UserName])
  	 #log_in @user
  	if @user.nil?
  		flash[:notice] = 'User not found'
  		redirect_to :action => 'Signin'

  	else

  	if @user.authenticate(params[:user][:password])
        redirect_to :action => 'Wall' , :id => @user._id
      else
        flash[:notice] = 'Unknown user. Please check your username and password.' 
        redirect_to :action => 'Signin', :id => @user._id
      end

  end
  end

  def userUpdate_params
  	params.require(:user).permit(:Name, :Age, :Address)
  end

  def user_params
  	params.require(:user).permit(:Name, :Age, :Address, :UserName, :password, :password_confirmation)
  end
end
