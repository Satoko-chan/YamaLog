class UsersController < ApplicationController
  before_action:authenticate_user,{only:[:index,:show,:edit,:update]}
  before_action:forbid_login_user,{only:[:new,:create,:login_form,:login]}
  before_action:ensure_correct_user,{only:[:edit,:update]}

  def index
    @users=User.all.order(created_at: :desc)
  end

  def show
    @user=User.find_by(id: params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "user_default.png",
      user_like: "What I'm interested",
      aboutUser: "Hello, nice to meet you!"
    )
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="Signed in!"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def update
    @user=User.find_by(id: params[:id])
    @user.name= params[:name]
    @user.email= params[:email]
    @user.user_like= params[:user_like]
    @user.aboutUser= params[:aboutUser]

    if params[:image]
      @user.image_name="#{@user.id}.jpg"
      image= params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice]="Successfully changed your user information."
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user=User.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice]="Logged in!"
      redirect_to("/posts/index")
    else
      @error_message="Your email address or password is wrong."
      @email= params[:email]
      @password= params[:password]
      render("users/login_form")
    end
  end


  def logout
    session[:user_id]=nil
    flash[:notice]="Logged out"
    redirect_to("/login")
  end

  def likes
    @user=User.find_by(id: params[:id])
    @likes=Like.where(user_id: @user.id)
    @likes=Like.all.order(created_at: :desc)
  end

end
