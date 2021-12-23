class SearchController < ApplicationController
    def search_user 
        @user = User.where("name LIKE ? AND email LIKE ?","#{params[:name]}%", "#{params[:email]}%" )
        puts @user
    end
end
