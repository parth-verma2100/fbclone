class PostsController < ApplicationController
    def index
        @posts = Post.all
        @users=User.all
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
