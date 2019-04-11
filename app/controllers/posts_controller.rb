class PostsController < ApplicationController
  before_action:authenticate_user

  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def show
    @post=Post.find_by(id: params[:id])
    @user=@post.user
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(
      title: params[:title],
      comment: params[:comment],
      user_id:@current_user.id,
      image_name:"work_default.jpg"
    )

    if params[:image]
      @post.image_name="#{@post.id}.jpg"
      image=params[:image]
      File.binwrite("public/work_images/#{@post.image_name}", image.read)
    end

    if @post.save
      flash[:notice]="投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    @post.title= params[:title]
    @post.comment= params[:comment]
    if @post.save
      flash[:notice]="投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to("/posts/index")
  end
end
