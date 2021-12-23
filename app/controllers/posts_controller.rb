class PostsController < ApplicationController
    def index
        @posts = Post.all
        @users=User.all
    end
    def accept
        @reqs=Requestnotification.where(user:params[:id].to_i, friend_user:current_user.id).to_a
        @reqs1=Requestnotification.where(user:current_user.id, friend_user:params[:id].to_i).to_a
        @reqs.each do |req|
            req.destroy
        end
        @reqs1.each do |req|
            req.destroy
        end
        @accept=Friend.create(current_user: current_user.id, friend_user:params[:id], date: Date.today())
        if @accept.save
            render "posts/accept"
        end        
    end
    def addfriend
        if user_signed_in?
          @request=Requestnotification.create(user: current_user.id, friend_user:params[:id])
          @notify=Requestnotification.where(user: current_user.id).to_a
          @friendlist=Friend.where(current_user: current_user.id).to_a
        end
    end
    
    def show
        @post=Post.find(params[:id])
    end
    def new
        if user_signed_in?
          @user=current_user
          @post = @user.posts.new
        end
    end
    def create
        if user_signed_in?
          @user=current_user
          @post = @user.posts.create(post_params)
          if @post.save
             redirect_to root_path
          end
        end
    end
    def update
        
    end
    def destroy
          @user=User.find(current_user.id)
          @post = @user.posts.find(params[:id])
          @post.destroy
          redirect_to root_path
    end
    private
    def post_params
        params.require(:post).permit(:date,:content,:user_id)
    end
end
